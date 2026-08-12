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
      url "https://github.com/phall1/blackbird/releases/download/v0.1.7/blackbird-v0.1.7-aarch64-apple-darwin.tar.gz"
      sha256 "350295b675c1dc2b8e93b88dc64fa42453fb4c9250524cd619d20b77a38ae92d"
    else
      odie "Blackbird currently requires Apple Silicon on macOS"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/phall1/blackbird/releases/download/v0.1.7/blackbird-v0.1.7-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "5e9766c6e1dc6a9b90d61d6bc3acb104e3180ce99514d19b1593b28c142a5be8"
    else
      url "https://github.com/phall1/blackbird/releases/download/v0.1.7/blackbird-v0.1.7-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "2ed099d76ac579aa5a5fd57a99f9b3813ed8726d38df923ba058706d7dd8b6ba"
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
