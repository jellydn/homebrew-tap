# frozen_string_literal: true

cask "folderlens" do
  version "0.5.0"
  sha256 "229684720cd36c22911436b4480795823251f7c5168f4320210a216ec77f8394"

  url "https://github.com/jellydn/folderlens/releases/download/v#{version}/FolderLens-#{version}-macos-arm64.dmg"
  name "FolderLens"
  desc "Menu-bar cleanup review that moves items to the Trash only after you confirm"
  homepage "https://github.com/jellydn/folderlens"

  livecheck do
    url :url
    strategy :github_latest
  end

  depends_on arch: :arm64
  depends_on macos: ">= :sonoma"

  app "FolderLens.app"
end
