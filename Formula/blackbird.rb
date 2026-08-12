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
      url "https://github.com/phall1/blackbird/releases/download/v0.2.0/blackbird-v0.2.0-aarch64-apple-darwin.tar.gz"
      sha256 "d83704dd5cbc0eed27e2f78a4f78694b75de687daf95f25927c292650f44a504"
    else
      odie "Blackbird currently requires Apple Silicon on macOS"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/phall1/blackbird/releases/download/v0.2.0/blackbird-v0.2.0-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "c69cdb88e99199ae5fe90563bc851e61c62d6aa7602b3e338f190b10c2195985"
    else
      url "https://github.com/phall1/blackbird/releases/download/v0.2.0/blackbird-v0.2.0-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "aad07689dfa75627d5059065c335d7413f19e8c4f35db77602af4683ea81f9e8"
    end
  end

  def install
    bin.install "blackbird", "blackbird-claude", "blackbird-pi"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/blackbird --version")
    assert_match version.to_s, shell_output("#{bin}/blackbird-claude --version")
    assert_match version.to_s, shell_output("#{bin}/blackbird-pi --version")
  end
end
