class FffMcp < Formula
  desc "Fast file search toolkit for AI agents (MCP server)"
  homepage "https://github.com/dmtrKovalenko/fff.nvim"
  license "MIT"

  # Homebrew reserves `version`; use a local for the release tag.
  v = "0.9.3"

  on_macos do
    on_arm do
      url "https://github.com/dmtrKovalenko/fff.nvim/releases/download/v0.9.3/fff-mcp-aarch64-apple-darwin"
      sha256 "43db8df09fca1217f6cd853250acd9ebd0706cf3d3fdd5686f0a95b95ebc6b48"
    end

    on_intel do
      url "https://github.com/dmtrKovalenko/fff.nvim/releases/download/v0.9.3/fff-mcp-x86_64-apple-darwin"
      sha256 "bec74a730588a3f763bfb7657b2e3411281eb98cc47b68f223d8ccfacba33e55"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/dmtrKovalenko/fff.nvim/releases/download/v0.9.3/fff-mcp-aarch64-unknown-linux-gnu"
      sha256 "8d4397d1c5a71e9043bffc40912a55776569433f681c8c6f5fc2d297c3a658b7"
    end

    on_intel do
      url "https://github.com/dmtrKovalenko/fff.nvim/releases/download/v0.9.3/fff-mcp-x86_64-unknown-linux-gnu"
      sha256 "17b9927fc088adde73843baa7d1d8119edf92a2f0920600cefb6a4a806891f91"
    end
  end

  def install
    if OS.mac?
      if Hardware::CPU.arm?
        bin.install "fff-mcp-aarch64-apple-darwin" => "fff-mcp"
      elsif Hardware::CPU.intel?
        bin.install "fff-mcp-x86_64-apple-darwin" => "fff-mcp"
      end
    elsif OS.linux?
      if Hardware::CPU.arm?
        bin.install "fff-mcp-aarch64-unknown-linux-gnu" => "fff-mcp"
      elsif Hardware::CPU.intel?
        bin.install "fff-mcp-x86_64-unknown-linux-gnu" => "fff-mcp"
      end
    end
  end

  test do
    system bin/"fff-mcp", "--version"
  end
end
