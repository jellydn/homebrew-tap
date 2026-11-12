# frozen_string_literal: true

cask "folderlens" do
  version "0.3.4"
  sha256 "80d6b4eda63380b223e7c2ed9c18b6062fc7c4371dbab21ae14f4e6930956013"

  url "https://github.com/jellydn/folderlens/releases/download/v#{version}/FolderLens-#{version}-macos-arm64.dmg"
  name "FolderLens"
  desc "Menu-bar cleanup review that never deletes files"
  homepage "https://github.com/jellydn/folderlens"

  livecheck do
    url :url
    strategy :github_latest
  end

  depends_on arch: :arm64
  depends_on macos: :sonoma

  app "FolderLens.app"
end
