# frozen_string_literal: true

cask "folderlens" do
  version "0.3.6"
  sha256 "ba247edf88fda5ae683baf53e53355cfbea82580e76c4a3d19408496420a8acd"

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
