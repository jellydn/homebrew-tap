class Codemux < Formula
  desc "Drop-in CLI binary that opens Zed terminals inside tmux or zellij"
  homepage "https://github.com/jellydn/zed-codemux"
  version "0.1.1"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/jellydn/zed-codemux/releases/download/v0.1.1/codemux-macos-arm64.tar.gz"
      sha256 "8c73daf27696d5618df6b87157c8af1c9fd8e61d042a77e359a98d713d7fe680"
    end
    on_intel do
      url "https://github.com/jellydn/zed-codemux/releases/download/v0.1.1/codemux-macos-x64.tar.gz"
      sha256 "39921916d3b2047d3a04df93eafa65a27ef45db80de8c26b4e13ac410f7ab175"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/jellydn/zed-codemux/releases/download/v0.1.1/codemux-linux-x64.tar.gz"
      sha256 "af92842a188277a7c0c1390178649f846e9aaa49cc561a5965ca1eabbde18cab"
    end
  end

  def install
    bin.install "codemux"
  end

  test do
    system "#{bin}/codemux", "--version"
  end
end
