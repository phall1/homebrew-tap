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
      url "https://github.com/phall1/blackbird/releases/download/v0.7.0/blackbird-v0.7.0-aarch64-apple-darwin.tar.gz"
      sha256 "2de5ca2cfb62e66af99e80b6ac1189e5be00d61b75bdef0ba80c8118ff506265"
    else
      odie "Blackbird currently requires Apple Silicon on macOS"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/phall1/blackbird/releases/download/v0.7.0/blackbird-v0.7.0-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "436c80ab03d8e667f34283d8cee84fe66a78bc4e475941b4391cd3f2102c6b39"
    else
      url "https://github.com/phall1/blackbird/releases/download/v0.7.0/blackbird-v0.7.0-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "0d9859f5a1d23d1af1eb4a7479b13469047ee2600b30bd9582102937ba6ba8f7"
    end
  end

  def install
    bin.install "blackbird"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/blackbird --version")
  end
end
