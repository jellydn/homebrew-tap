class FffMcp < Formula
  desc "Fast file search toolkit for AI agents (MCP server)"
  homepage "https://github.com/dmtrKovalenko/fff.nvim"
  license "MIT"

  # Homebrew reserves `version`; use a local for the release tag.
  v = "0.10.5"

  on_macos do
    on_arm do
      url "https://github.com/dmtrKovalenko/fff.nvim/releases/download/v0.10.5/fff-mcp-aarch64-apple-darwin"
      sha256 "2f1a75c2401e5df7f5a10827f9ce9fe8401f290ff99c3f3f1423c7d7b156d849"
    end

    on_intel do
      url "https://github.com/dmtrKovalenko/fff.nvim/releases/download/v0.10.5/fff-mcp-x86_64-apple-darwin"
      sha256 "c81e22a7fb657731a7441be877c622a110eb7e7dbc94e3b57d79c9cea91f38db"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/dmtrKovalenko/fff.nvim/releases/download/v0.10.5/fff-mcp-aarch64-unknown-linux-gnu"
      sha256 "48f5af0d9e6ef4506c5cccd3f4571da4f0acc9b9c0967832167e49fe651f8ee5"
    end

    on_intel do
      url "https://github.com/dmtrKovalenko/fff.nvim/releases/download/v0.10.5/fff-mcp-x86_64-unknown-linux-gnu"
      sha256 "0408cbac06303b3bf2041181089d8b4974b527883242bdcf8ba599b41c003973"
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
