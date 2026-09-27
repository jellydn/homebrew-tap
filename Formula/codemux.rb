class Codemux < Formula
  desc "Drop-in CLI binary that opens Zed terminals inside tmux or zellij"
  homepage "https://github.com/jellydn/zed-codemux"
  version "0.4.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/jellydn/zed-codemux/releases/download/v0.4.0/codemux-macos-arm64.tar.gz"
      sha256 "5976b1a1e1a24a8bb27263819c5f3fe38fac0618d8087fabc2cccd8a210601d2"
    end
    on_intel do
      url "https://github.com/jellydn/zed-codemux/releases/download/v0.4.0/codemux-macos-x64.tar.gz"
      sha256 "c6b54d73f3dfcc811bc4940d1f2f282053faa27041ab7c2e69088fa025f808cd"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/jellydn/zed-codemux/releases/download/v0.4.0/codemux-linux-arm64.tar.gz"
      sha256 "869eb17fc00d34340b12874563d469e7dc39e6070a7530f9ca947d15bbf34daf"
    end
    on_intel do
      url "https://github.com/jellydn/zed-codemux/releases/download/v0.4.0/codemux-linux-x64.tar.gz"
      sha256 "b38213004da99af0d7b9d1032bfbb8dfcd2e80c3f7f407a5f81f8ecba2291975"
    end
  end

  def install
    bin.install "codemux"
  end

  test do
    system "#{bin}/codemux", "--version"
  end
end
