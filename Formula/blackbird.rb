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
      url "https://github.com/phall1/blackbird/releases/download/v0.5.0/blackbird-v0.5.0-aarch64-apple-darwin.tar.gz"
      sha256 "db28dc71bd0ab3a015701a2a6ca91670a5f602418b320b7078f41f7ad80e013c"
    else
      odie "Blackbird currently requires Apple Silicon on macOS"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/phall1/blackbird/releases/download/v0.5.0/blackbird-v0.5.0-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "34e656d626db2e491f418d6ac58ca5ec6e202651187ac79c765448931af333e6"
    else
      url "https://github.com/phall1/blackbird/releases/download/v0.5.0/blackbird-v0.5.0-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "6b6ebe20ea24269738c82c6685eb5d07a490afc02195463758ca2734199076fb"
    end
  end

  def install
    bin.install "blackbird"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/blackbird --version")
  end
end
