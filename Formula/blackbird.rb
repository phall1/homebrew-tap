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
      url "https://github.com/phall1/blackbird/releases/download/v0.6.0/blackbird-v0.6.0-aarch64-apple-darwin.tar.gz"
      sha256 "8b067721d7c7fd1960bbc4b7dbe642991a381264bb816325a5d9ecc7a71d535e"
    else
      odie "Blackbird currently requires Apple Silicon on macOS"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/phall1/blackbird/releases/download/v0.6.0/blackbird-v0.6.0-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "aa99dc74522f50a5cbd12c89f5894e12d31ea72b59b03d6cef14cf51b00296e4"
    else
      url "https://github.com/phall1/blackbird/releases/download/v0.6.0/blackbird-v0.6.0-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "1c906f16585d93b320afea1386542e09e591f726215e01733ba4fbb2e8b01eb5"
    end
  end

  def install
    bin.install "blackbird"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/blackbird --version")
  end
end
