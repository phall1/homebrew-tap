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
      url "https://github.com/phall1/blackbird/releases/download/v0.8.0/blackbird-v0.8.0-aarch64-apple-darwin.tar.gz"
      sha256 "86f5da1f4cd5023fa352ee461290d867290d06fbe23372a0524c5db94db318b3"
    else
      odie "Blackbird currently requires Apple Silicon on macOS"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/phall1/blackbird/releases/download/v0.8.0/blackbird-v0.8.0-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "41619dc408d6bb784e7b000b8707c1468bae105f20b29598e1e9f93764457e5f"
    else
      url "https://github.com/phall1/blackbird/releases/download/v0.8.0/blackbird-v0.8.0-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "fffc0774fcce047bc073faad7700e9c295d8202260458fc01dfb86203e7b469d"
    end
  end

  def install
    bin.install "blackbird"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/blackbird --version")
  end
end
