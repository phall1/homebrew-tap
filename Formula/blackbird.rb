# Generated from tools/blackbird.json. Do not edit by hand.
class Blackbird < Formula
  desc "Durable local-first coordination for human and AI agent work"
  homepage "https://github.com/phall1/blackbird"

  livecheck do
    url :stable
    strategy :github_latest
  end

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/phall1/blackbird/releases/download/v0.1.6/blackbird-v0.1.6-aarch64-apple-darwin.tar.gz"
      sha256 "d64675509f98fd57519cc0a26a322823cd7465deaf0b2c385181dea1a56b4ca9"
    else
      odie "Blackbird currently requires Apple Silicon on macOS"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/phall1/blackbird/releases/download/v0.1.6/blackbird-v0.1.6-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "56d9a52a87a71938b16d7d56392fd93025620ac319167abf51cf0a2ec072d532"
    else
      url "https://github.com/phall1/blackbird/releases/download/v0.1.6/blackbird-v0.1.6-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "e85f5d7f108672ec21870a9e9f471bc669852216f59e505dbc1321ddefce3311"
    end
  end

  def install
    bin.install "blackbird", "blackbird-claude"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/blackbird --version")
    assert_match version.to_s, shell_output("#{bin}/blackbird-claude --version")
  end
end
