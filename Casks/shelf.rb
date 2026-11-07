# frozen_string_literal: true

cask "shelf" do
  version "0.1.0"
  sha256 "19b6f64ed50b8d5b3d51cebb2aa32294b8d798993b29f1192f79f270d7cd3523"

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
