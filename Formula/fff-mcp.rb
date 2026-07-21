class FffMcp < Formula
  desc "Fast file search toolkit for AI agents (MCP server)"
  homepage "https://github.com/dmtrKovalenko/fff.nvim"
  license "MIT"

  # Homebrew reserves `version`; use a local for the release tag.
  v = "0.10.1"

  on_macos do
    on_arm do
      url "https://github.com/dmtrKovalenko/fff.nvim/releases/download/v0.10.1/fff-mcp-aarch64-apple-darwin"
      sha256 "eff6660a9c48e3e1972d557c1003e057e5ff99d6039f5f810671f2123093fdfc"
    end

    on_intel do
      url "https://github.com/dmtrKovalenko/fff.nvim/releases/download/v0.10.1/fff-mcp-x86_64-apple-darwin"
      sha256 "d3c8d70d47ab80afa2287e1b4546b23f494bb4604b80e5a706a0af714ee25674"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/dmtrKovalenko/fff.nvim/releases/download/v0.10.1/fff-mcp-aarch64-unknown-linux-gnu"
      sha256 "ed628d57200e48298fcbeffc0f6d85fb572de02bb900bcc6fc7cc05e33ba2777"
    end

    on_intel do
      url "https://github.com/dmtrKovalenko/fff.nvim/releases/download/v0.10.1/fff-mcp-x86_64-unknown-linux-gnu"
      sha256 "3541dad4663fc9e5b8b97ce8bd20084ddae08a3c6cb828fcfbcbb6ca8c411513"
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
