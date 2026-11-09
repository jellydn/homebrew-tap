# frozen_string_literal: true

cask "shelf" do
  version "0.2.0"
  sha256 "5a959681850c6331af51956cea6d8f1ac6bb5ad419f47421d551fb369d37a364"

  url "https://github.com/jellydn/shelf/releases/download/v#{version}/Shelf-#{version}-macos-arm64.dmg"
  name "Shelf"
  desc "Menu-bar cleanup review that never deletes files"
  homepage "https://github.com/jellydn/shelf"

  livecheck do
    url :url
    strategy :github_latest
  end

  depends_on arch: :arm64
  depends_on macos: :sonoma

  app "Shelf.app"
end
