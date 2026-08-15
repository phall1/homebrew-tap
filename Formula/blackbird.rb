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
      url "https://github.com/phall1/blackbird/releases/download/v0.4.0/blackbird-v0.4.0-aarch64-apple-darwin.tar.gz"
      sha256 "c0f2073a98ee4612c1a85a00539d455a97c1dcb3f3205d4abb1929814a5d43df"
    else
      odie "Blackbird currently requires Apple Silicon on macOS"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/phall1/blackbird/releases/download/v0.4.0/blackbird-v0.4.0-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "da01465d265bde8a9a5e6efdd9c190ffa0d5a174fda79980e57966bbd0bd8c97"
    else
      url "https://github.com/phall1/blackbird/releases/download/v0.4.0/blackbird-v0.4.0-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "8867b07c3278e9487322f69d05759d2751e6fd8d21e72c691c6abc72d63b97ff"
    end
  end

  def install
    bin.install "blackbird"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/blackbird --version")
  end
end
