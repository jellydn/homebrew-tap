import hashlib
import json
import os
from pathlib import Path
import shutil
import subprocess
import sys
import tempfile
import unittest


ROOT = Path(__file__).resolve().parents[1]
PAYLOAD = b"harmless release fixture"
DIGEST = hashlib.sha256(PAYLOAD).hexdigest()
LEGACY_CASK = f'''# frozen_string_literal: true

cask "folderlens" do
  version "0.2.0"
  sha256 "{DIGEST}"

  url "https://github.com/jellydn/folderlens/releases/download/v#{{version}}/Shelf-#{{version}}-macos-arm64.dmg"
  name "FolderLens"
  desc "Menu-bar cleanup review that never deletes files"
  homepage "https://github.com/jellydn/folderlens"

  livecheck do
    url :url
    strategy :github_latest
  end

  depends_on arch: :arm64
  depends_on macos: :sonoma

  app "Shelf.app"
end
'''


class BumpFolderLensTests(unittest.TestCase):
    def setUp(self):
        self.temporary = tempfile.TemporaryDirectory()
        self.addCleanup(self.temporary.cleanup)
        self.root = Path(self.temporary.name)
        (self.root / "scripts").mkdir()
        (self.root / "Casks").mkdir()
        shutil.copy(ROOT / "scripts/bump-folderlens.py", self.root / "scripts")
        self.cask = self.root / "Casks/folderlens.rb"
        self.original = LEGACY_CASK
        self.cask.write_text(self.original)
        self.env = {**os.environ, "PATH": str(self.root) + os.pathsep + os.environ["PATH"]}
        self.env["FIXTURE_ROOT"] = str(self.root)
        for name, body in {
            "gh": 'print((root / "release.json").read_text())',
            "curl": '''args = sys.argv[1:]
release = json.loads((root / "release.json").read_text())
asset = release["assets"][0]["name"]
assert args[-3] == "https://github.com/jellydn/folderlens/releases/download/" + release["tag_name"] + "/" + asset
pathlib.Path(args[-1]).write_bytes((root / "payload").read_bytes())
(root / "fetched").touch()''',
        }.items():
            executable = self.root / name
            executable.write_text(f"#!{sys.executable}\nimport json, os, pathlib, sys\nroot = pathlib.Path(os.environ['FIXTURE_ROOT'])\n{body}\n")
            executable.chmod(0o700)
        (self.root / "payload").write_bytes(PAYLOAD)

    def release(self, version, product):
        return {
            "tag_name": "v" + version, "draft": False, "prerelease": False,
            "assets": [{"name": f"{product}-{version}-macos-arm64.dmg", "digest": "sha256:" + DIGEST}],
        }

    def run_bump(self, release):
        (self.root / "release.json").write_text(json.dumps(release))
        return subprocess.run([sys.executable, str(self.root / "scripts/bump-folderlens.py")], env=self.env, text=True, capture_output=True)

    def test_legacy_release_preserves_corrected_cask_and_digest(self):
        expected = self.cask.read_text()
        for _ in range(2):
            result = self.run_bump(self.release("0.2.0", "Shelf"))
            self.assertEqual(result.returncode, 0, result.stderr)
            self.assertEqual(self.cask.read_text(), expected)
        self.assertFalse((self.root / "fetched").exists())

    def test_same_version_digest_with_wrong_names_is_repaired(self):
        self.cask.write_text(self.original.replace("Shelf-", "FolderLens-").replace('app "Shelf.app"', 'app "FolderLens.app"'))
        result = self.run_bump(self.release("0.2.0", "Shelf"))
        self.assertEqual(result.returncode, 0, result.stderr)
        self.assertEqual(self.cask.read_text(), self.original)
        self.assertTrue((self.root / "fetched").exists())

    def test_same_release_repairs_deprecated_macos_declaration(self):
        self.cask.write_text(self.original.replace('macos: :sonoma', 'macos: ">= :sonoma"'))
        result = self.run_bump(self.release("0.2.0", "Shelf"))
        self.assertEqual(result.returncode, 0, result.stderr)
        self.assertEqual(self.cask.read_text(), self.original)

    def test_future_release_uses_folderlens_names_and_is_repeatable(self):
        release = self.release("0.2.1", "FolderLens")
        result = self.run_bump(release)
        self.assertEqual(result.returncode, 0, result.stderr)
        text = self.cask.read_text()
        self.assertIn('version "0.2.1"', text)
        self.assertIn(f'sha256 "{DIGEST}"', text)
        self.assertIn("/FolderLens-#{version}-macos-arm64.dmg", text)
        self.assertIn('app "FolderLens.app"', text)
        self.assertIn('depends_on macos: :sonoma', text)
        (self.root / "fetched").unlink()
        self.assertEqual(self.run_bump(release).returncode, 0)
        self.assertEqual(self.cask.read_text(), text)
        self.assertFalse((self.root / "fetched").exists())

    def test_invalid_release_or_digest_never_changes_cask(self):
        cases = []
        for field, value in [("draft", True), ("prerelease", True), ("tag_name", "v0.2.1-beta.1"), ("assets", [])]:
            release = self.release("0.2.1", "FolderLens")
            release[field] = value
            cases.append(release)
        for digest in ["", "sha256:" + "0" * 64]:
            release = self.release("0.2.1", "FolderLens")
            release["assets"][0]["digest"] = digest
            cases.append(release)
        for release in cases:
            with self.subTest(release=release):
                self.assertNotEqual(self.run_bump(release).returncode, 0)
                self.assertEqual(self.cask.read_text(), self.original)


if __name__ == "__main__":
    unittest.main()
