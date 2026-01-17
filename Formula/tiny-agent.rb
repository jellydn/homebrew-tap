class TinyAgent < Formula
  desc "A lightweight, extensible coding agent built in TypeScript"
  homepage "https://github.com/jellydn/tiny-coding-agent"
  version "0.1.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/jellydn/tiny-coding-agent/releases/latest/download/tiny-agent-macos-arm64"
    end
    on_intel do
      url "https://github.com/jellydn/tiny-coding-agent/releases/latest/download/tiny-agent-macos-x64"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/jellydn/tiny-coding-agent/releases/latest/download/tiny-agent-linux-arm64"
    end
    on_intel do
      url "https://github.com/jellydn/tiny-coding-agent/releases/latest/download/tiny-agent-linux-x64"
    end
  end

  def install
    os = OS.mac? ? "macos" : "linux"
    arch = Hardware::CPU.arm? ? "arm64" : "x64"
    bin.install "tiny-agent-#{os}-#{arch}" => "tiny-agent"
  end

  test do
    assert_match "tiny-agent", shell_output("#{bin}/tiny-agent --help 2>&1", 0)
  end
end
