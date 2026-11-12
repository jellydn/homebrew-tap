# frozen_string_literal: true

cask "folderlens" do
  version "0.3.5"
  sha256 "0ae60e9248772e1e38a20a8842cc27dc03e1205a8e7583cb24235b2a66dd2bf9"

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
