class FffMcp < Formula
  desc "Fast file search toolkit for AI agents (MCP server)"
  homepage "https://github.com/dmtrKovalenko/fff.nvim"
  license "MIT"

  # Homebrew reserves `version`; use a local for the release tag.
  v = "0.10.0"

  on_macos do
    on_arm do
      url "https://github.com/dmtrKovalenko/fff.nvim/releases/download/v0.10.0/fff-mcp-aarch64-apple-darwin"
      sha256 "a5b95aa4b5861e5c7440fede6056cc7861223abda5796daabe51f785458211c3"
    end

    on_intel do
      url "https://github.com/dmtrKovalenko/fff.nvim/releases/download/v0.10.0/fff-mcp-x86_64-apple-darwin"
      sha256 "81a8acdc7b17b7ff54baaa6a23942974855fdfe4133f97347c9b0cb44e9df79f"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/dmtrKovalenko/fff.nvim/releases/download/v0.10.0/fff-mcp-aarch64-unknown-linux-gnu"
      sha256 "370c3ffcd1be8e560c05eaba2b280a016e313c6061a3f307bae7c7427c4778c7"
    end

    on_intel do
      url "https://github.com/dmtrKovalenko/fff.nvim/releases/download/v0.10.0/fff-mcp-x86_64-unknown-linux-gnu"
      sha256 "e252dc1bb0412c2719813ccd0095523676f360dddb0af731a778572ab696b592"
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
