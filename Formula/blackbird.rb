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
      url "https://github.com/phall1/blackbird/releases/download/v0.4.1/blackbird-v0.4.1-aarch64-apple-darwin.tar.gz"
      sha256 "f9a40f76b7be3e143941131420225a0c4cfaae83cb4544a47963d2b17058797e"
    else
      odie "Blackbird currently requires Apple Silicon on macOS"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/phall1/blackbird/releases/download/v0.4.1/blackbird-v0.4.1-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "880e32edb63fe2c625d546e0571d75a1b5dd5176d5862688ba07541eca434c0d"
    else
      url "https://github.com/phall1/blackbird/releases/download/v0.4.1/blackbird-v0.4.1-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "66d4de26e95358d80fa2f9364894655fd0efdfa69a20a664cb0e564a3d8afafa"
    end
  end

  def install
    bin.install "blackbird"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/blackbird --version")
  end
end
