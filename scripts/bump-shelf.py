#!/usr/bin/env python3
"""Update only the Shelf cask from a verified stable GitHub release asset."""

import hashlib
import json
from pathlib import Path
import re
import subprocess
import tempfile


release = json.loads(subprocess.check_output([
    "gh", "api", "repos/jellydn/shelf/releases/latest",
], text=True))
tag = release["tag_name"]
if release["draft"] or release["prerelease"] or not re.fullmatch(r"v\d+\.\d+\.\d+", tag):
    raise SystemExit("Shelf requires a published stable semantic version")
version = tag[1:]
name = f"Shelf-{version}-macos-arm64.dmg"
asset = next((asset for asset in release["assets"] if asset["name"] == name), None)
if asset is None:
    raise SystemExit(f"Missing release asset: {name}")
digest = asset.get("digest", "")
if not re.fullmatch(r"sha256:[a-f0-9]{64}", digest):
    raise SystemExit("GitHub did not provide a SHA-256 asset digest")
sha256 = digest.removeprefix("sha256:")
cask = Path(__file__).resolve().parents[1] / "Casks/shelf.rb"
if cask.exists():
    current = cask.read_text()
    if f'version "{version}"' in current and f'sha256 "{sha256}"' in current:
        print(f"Shelf {version} is already up to date")
        raise SystemExit(0)

url = f"https://github.com/jellydn/shelf/releases/download/{tag}/{name}"
with tempfile.TemporaryDirectory(prefix="shelf-cask-") as directory:
    download = Path(directory) / name
    subprocess.run(["curl", "--fail", "--location", "--retry", "3", url, "-o", str(download)], check=True)
    actual = hashlib.sha256(download.read_bytes()).hexdigest()
    if actual != sha256:
        raise SystemExit("Downloaded DMG does not match GitHub's asset digest")

cask.parent.mkdir(exist_ok=True)
cask.write_text(f'''# frozen_string_literal: true

cask "shelf" do
  version "{version}"
  sha256 "{sha256}"

  url "https://github.com/jellydn/shelf/releases/download/v#{{version}}/Shelf-#{{version}}-macos-arm64.dmg"
  name "Shelf"
  desc "Menu-bar cleanup review that never deletes files"
  homepage "https://github.com/jellydn/shelf"

  livecheck do
    url :url
    strategy :github_latest
  end

  depends_on arch: :arm64
  depends_on macos: :sonoma

  app "Shelf.app"
end
''')
print(f"Updated Shelf {version}: {sha256}")
