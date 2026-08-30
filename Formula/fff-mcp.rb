class FffMcp < Formula
  desc "Fast file search toolkit for AI agents (MCP server)"
  homepage "https://github.com/dmtrKovalenko/fff.nvim"
  license "MIT"

  # Homebrew reserves `version`; use a local for the release tag.
  v = "0.10.6"

  on_macos do
    on_arm do
      url "https://github.com/dmtrKovalenko/fff.nvim/releases/download/v0.10.6/fff-mcp-aarch64-apple-darwin"
      sha256 "02e0f57f5b88fa698494f310d8005a0c34d5bda5a1fcd069520b35f8e2319892"
    end

    on_intel do
      url "https://github.com/dmtrKovalenko/fff.nvim/releases/download/v0.10.6/fff-mcp-x86_64-apple-darwin"
      sha256 "12f374554f1930434cacee8221d9a76afd9e4dde0d9112c3bbc3ea59d5b56e83"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/dmtrKovalenko/fff.nvim/releases/download/v0.10.6/fff-mcp-aarch64-unknown-linux-gnu"
      sha256 "c557a0fc6463d013bd1850e8d2cfbd823b5ff41a7386e0803ab552ef55c6bf31"
    end

    on_intel do
      url "https://github.com/dmtrKovalenko/fff.nvim/releases/download/v0.10.6/fff-mcp-x86_64-unknown-linux-gnu"
      sha256 "3b887b272d580f34f9fe6c60cd126be54c4a7cf5f8ffb122d86c81f29b98524e"
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
