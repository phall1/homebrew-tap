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
      url "https://github.com/phall1/blackbird/releases/download/v0.1.5/blackbird-v0.1.5-aarch64-apple-darwin.tar.gz"
      sha256 "d5fbcb8780a42fc5cc620240e462114efadd65dc92a61a2b752f64952163e15b"
    else
      odie "Blackbird currently requires Apple Silicon on macOS"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/phall1/blackbird/releases/download/v0.1.5/blackbird-v0.1.5-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "1f56916871618b997ba1dd416a95f9e8bc8d59eff6fcabf21f5f06941107162b"
    else
      url "https://github.com/phall1/blackbird/releases/download/v0.1.5/blackbird-v0.1.5-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "29a11da34c750c22ceeba1195f29814681c28426f709436c9537bde98390c655"
    end
  end

  def install
    bin.install "blackbird", "blackbird-claude"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/blackbird --version")
    assert_match version.to_s, shell_output("#{bin}/blackbird-claude --version")
  end
end
