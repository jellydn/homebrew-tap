# frozen_string_literal: true

cask "folderlens" do
  version "0.2.1"
  sha256 "833cdc04086d09a7af4c2008b44f51be3b5760a744f1444339d6d2f9ed2b9874"

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
