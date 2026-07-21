class Codemux < Formula
  desc "Drop-in CLI binary that opens Zed terminals inside tmux or zellij"
  homepage "https://github.com/jellydn/zed-codemux"
  version "0.3.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/jellydn/zed-codemux/releases/download/v0.3.0/codemux-macos-arm64.tar.gz"
      sha256 "0ec76a87653c8d307b4004bb9ce4381688274c957434750eba8278efcb7f11ce"
    end
    on_intel do
      url "https://github.com/jellydn/zed-codemux/releases/download/v0.3.0/codemux-macos-x64.tar.gz"
      sha256 "75e9765eebeb9f88129329738881afc7ce4de19b2e3368d500398e7d7f82991d"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/jellydn/zed-codemux/releases/download/v0.3.0/codemux-linux-arm64.tar.gz"
      sha256 "b782fe41ec53136c6f8f2e4735a2c9f596cee31e48bb70440ad1a88d54fda006"
    end
    on_intel do
      url "https://github.com/jellydn/zed-codemux/releases/download/v0.3.0/codemux-linux-x64.tar.gz"
      sha256 "c9f0cf7f2eaf70ef411849f43622e57f26c861cdea4f75e0aa569637a9483b28"
    end
  end

  def install
    bin.install "codemux"
  end

  test do
    system "#{bin}/codemux", "--version"
  end
end
