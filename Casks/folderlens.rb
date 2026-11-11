# frozen_string_literal: true

cask "folderlens" do
  version "0.3.3"
  sha256 "42ede1168f24fdf410bd6d6c921607f94d7540c1089e6296eb7b5fa1ee7167f1"

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
