class Codemux < Formula
  desc "Drop-in CLI binary that opens Zed terminals inside tmux or zellij"
  homepage "https://github.com/jellydn/zed-codemux"
  version "0.2.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/jellydn/zed-codemux/releases/download/v0.2.0/codemux-macos-arm64.tar.gz"
      sha256 "0bfe869cedd49b870888e229dc85e8a80d6b4008a5544614a0bb05e951f42758"
    end
    on_intel do
      url "https://github.com/jellydn/zed-codemux/releases/download/v0.2.0/codemux-macos-x64.tar.gz"
      sha256 "9074d124877e80abff154cba5b129874df191d718049a7a7d5c8b841df9e3c83"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/jellydn/zed-codemux/releases/download/v0.2.0/codemux-linux-x64.tar.gz"
      sha256 "cffb61777ea9ac5da5050cc5dd49c806e07075f5e165b09d8293a0672a13a5dd"
    end
  end

  def install
    bin.install "codemux"
  end

  test do
    system "#{bin}/codemux", "--version"
  end
end
