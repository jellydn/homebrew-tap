class FffMcp < Formula
  desc "Fast file search toolkit for AI agents (MCP server)"
  homepage "https://github.com/dmtrKovalenko/fff.nvim"
  license "MIT"

  # Homebrew reserves `version`; use a local for the release tag.
  v = "0.9.4"

  on_macos do
    on_arm do
      url "https://github.com/dmtrKovalenko/fff.nvim/releases/download/v0.9.4/fff-mcp-aarch64-apple-darwin"
      sha256 "90a7007d378583531cb3ca03037303ce0bd1ec7b31ca86a5b90d5683440df5b3"
    end

    on_intel do
      url "https://github.com/dmtrKovalenko/fff.nvim/releases/download/v0.9.4/fff-mcp-x86_64-apple-darwin"
      sha256 "20a91c0421ac05b9d32f0349ff147e5d0ad118ce6cd8a831ba9a873d98676cfd"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/dmtrKovalenko/fff.nvim/releases/download/v0.9.4/fff-mcp-aarch64-unknown-linux-gnu"
      sha256 "9d942894be613901ddea645337dcdd47e30ef78bf5a80530e01fe9b25b56c925"
    end

    on_intel do
      url "https://github.com/dmtrKovalenko/fff.nvim/releases/download/v0.9.4/fff-mcp-x86_64-unknown-linux-gnu"
      sha256 "b5dfc5b3c17cb35b681022a2b318ebc4e280d7c8c9b517177befdb79a31d6ec3"
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
