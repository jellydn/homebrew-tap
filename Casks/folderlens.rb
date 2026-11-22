# frozen_string_literal: true

cask "folderlens" do
  version "0.4.0"
  sha256 "bee0088e778ba82e01d00f4c9f1211cf3a32968ec8b58b67ccc6b3fbb4789f57"

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
