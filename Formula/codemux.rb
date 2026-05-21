class Codemux < Formula
  desc "Drop-in CLI binary that opens Zed terminals inside tmux or zellij"
  homepage "https://github.com/jellydn/zed-codemux"
  version "0.2.3"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/jellydn/zed-codemux/releases/download/v0.2.3/codemux-macos-arm64.tar.gz"
      sha256 "fb555f1d95b0117e4b282816c91b79ea1ee7ae6927cf662e70c49bf3d0e27bc6"
    end
    on_intel do
      url "https://github.com/jellydn/zed-codemux/releases/download/v0.2.3/codemux-macos-x64.tar.gz"
      sha256 "951af480eb34dfeaa56fccb82a5420c44923d02f10bdd4f172533e7d85f342e7"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/jellydn/zed-codemux/releases/download/v0.2.3/codemux-linux-x64.tar.gz"
      sha256 "a10911b6a246735e552ace10ed7de337056cfa215532c1612684a3a60d4b9503"
    end
  end

  def install
    bin.install "codemux"
  end

  test do
    system "#{bin}/codemux", "--version"
  end
end
