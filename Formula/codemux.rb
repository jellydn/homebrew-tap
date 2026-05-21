class Codemux < Formula
  desc "Drop-in CLI binary that opens Zed terminals inside tmux or zellij"
  homepage "https://github.com/jellydn/zed-codemux"
  version "0.2.4"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/jellydn/zed-codemux/releases/download/v0.2.4/codemux-macos-arm64.tar.gz"
      sha256 "46e554bb72e1c5e4a85fca0683f6a8e8a0937ef45bc31ca5995c211d8ef3b652"
    end
    on_intel do
      url "https://github.com/jellydn/zed-codemux/releases/download/v0.2.4/codemux-macos-x64.tar.gz"
      sha256 "9b1c5dedc2a1178d8204b68f3316319f67ea7fc236e49f97ef10deae6611e2ed"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/jellydn/zed-codemux/releases/download/v0.2.4/codemux-linux-x64.tar.gz"
      sha256 "0326821f5f9ff3ad693d20b96b25cdf5d88a2eed645bd1a1a3718e27c1f88a3d"
    end
  end

  def install
    bin.install "codemux"
  end

  test do
    system "#{bin}/codemux", "--version"
  end
end
