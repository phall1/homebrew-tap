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
      url "https://github.com/phall1/blackbird/releases/download/v0.3.0/blackbird-v0.3.0-aarch64-apple-darwin.tar.gz"
      sha256 "d0e83c4f4a11e5b976c3c4b48bed0f830537ed1a08fc164ccbb9e84aa7e892dd"
    else
      odie "Blackbird currently requires Apple Silicon on macOS"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/phall1/blackbird/releases/download/v0.3.0/blackbird-v0.3.0-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "7905ddf8bb2cf091bd2bcdbdfc43b43be974324ba249b4d499f10628d0cefb65"
    else
      url "https://github.com/phall1/blackbird/releases/download/v0.3.0/blackbird-v0.3.0-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "2fd8d13415e72d8ffb11d45713a458daf07aa8a99e4100bec00ff0df05f0a008"
    end
  end

  def install
    bin.install "blackbird"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/blackbird --version")
  end
end
