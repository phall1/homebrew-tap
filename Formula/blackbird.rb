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
      url "https://github.com/phall1/blackbird/releases/download/v0.1.3/blackbird-v0.1.3-aarch64-apple-darwin.tar.gz"
      sha256 "20b2ad2c609ae48257591df905d13a3b8a24e9111481ac81131d6897c1a20b29"
    else
      odie "Blackbird currently requires Apple Silicon on macOS"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/phall1/blackbird/releases/download/v0.1.3/blackbird-v0.1.3-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "6ed753b3c4fc5a9c5c77e602ba3d5691aed893848564e0b8e06c581a1f520b58"
    else
      url "https://github.com/phall1/blackbird/releases/download/v0.1.3/blackbird-v0.1.3-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "0e7db55d6f52149fb420c42b571222ed09ec6e78a1b39fd674a868ddcb55a62d"
    end
  end

  def install
    bin.install "blackbird"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/blackbird --version")
  end
end
