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
      url "https://github.com/phall1/blackbird/releases/download/v0.9.0/blackbird-v0.9.0-aarch64-apple-darwin.tar.gz"
      sha256 "cae08bc079651c832d1a3b43ab2cfaa34b766ee5222386750f754240d5b9e41d"
    else
      odie "Blackbird currently requires Apple Silicon on macOS"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/phall1/blackbird/releases/download/v0.9.0/blackbird-v0.9.0-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "c41417f7a1a7328493609ad9f867e7f8326dce557a872bed61a3b7521a925418"
    else
      url "https://github.com/phall1/blackbird/releases/download/v0.9.0/blackbird-v0.9.0-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "572770f101f4a9fa1549fca15120f1f1c92d3d0707d9ef25f0de18bd71aec6e9"
    end
  end

  def install
    bin.install "blackbird"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/blackbird --version")
  end
end
