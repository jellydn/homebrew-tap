# frozen_string_literal: true

cask "folderlens" do
  version "0.3.8"
  sha256 "9ee40700aebfe314e7921e558d8b21c4263f1a7b55964fe8c6192bf535d769f7"

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
