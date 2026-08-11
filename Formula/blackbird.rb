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
      url "https://github.com/phall1/blackbird/releases/download/v0.1.2/blackbird-v0.1.2-aarch64-apple-darwin.tar.gz"
      sha256 "acc33bf00627748459f0cd58bd3041f5bd39e9e0f8072a09809b0679329cca7b"
    else
      odie "Blackbird currently requires Apple Silicon on macOS"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/phall1/blackbird/releases/download/v0.1.2/blackbird-v0.1.2-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "67b9cb907878a42fd276e7cf7d035cb8661f44f8bae9a2c75199974b7ffa9738"
    else
      url "https://github.com/phall1/blackbird/releases/download/v0.1.2/blackbird-v0.1.2-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "828a19f4a83d9b72f93804a208a03d3212193ac503754809719b06ce9ccf5e47"
    end
  end

  def install
    bin.install "blackbird"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/blackbird --version")
  end
end
