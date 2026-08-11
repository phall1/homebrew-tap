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
      url "https://github.com/phall1/blackbird/releases/download/v0.1.1/blackbird-v0.1.1-aarch64-apple-darwin.tar.gz"
      sha256 "5b758ede2fd745d016ec09ad18e5b0079e2965195ee5729c02c51db7fa3193d5"
    else
      odie "Blackbird currently requires Apple Silicon on macOS"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/phall1/blackbird/releases/download/v0.1.1/blackbird-v0.1.1-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "ec0a4ef25d175dfbaa6c2469d1653baabfd62ad70b0507ca6de405caf290add6"
    else
      url "https://github.com/phall1/blackbird/releases/download/v0.1.1/blackbird-v0.1.1-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "6b9f45e9cc8c0d340fff0d1842fb843eca6cd6106f80414c41893bdeffe03292"
    end
  end

  def install
    bin.install "blackbird"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/blackbird --version")
  end
end
