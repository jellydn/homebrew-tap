# frozen_string_literal: true

cask "folderlens" do
  version "0.3.9"
  sha256 "17c64c7ca9c883342c4f1c74f628ba29dbe7d7f4e2451f49a0135ab4ce6ff2f5"

  url "https://github.com/jellydn/folderlens/releases/download/v#{version}/FolderLens-#{version}-macos-arm64.dmg"
  name "FolderLens"
  desc "Menu-bar cleanup review that never deletes files"
  homepage "https://github.com/jellydn/folderlens"

  livecheck do
    url :url
    strategy :github_latest
  end

  depends_on arch: :arm64
  depends_on macos: ">= :sonoma"

  app "FolderLens.app"
end
