# Generated from tools/phui.json. Do not edit by hand.
class Phui < Formula
  desc "Terminal UI for GitHub pull requests, issues, diffs, and Actions"
  homepage "https://github.com/phall1/phui"

  livecheck do
    url :stable
    strategy :github_latest
  end

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/phall1/phui/releases/download/v0.14.1/phui-darwin-arm64.tar.gz"
      sha256 "bcacde541573792c0a70bef3f1c5b3cfed612dd2d7902adf810bda0b1f5025c4"
    else
      url "https://github.com/phall1/phui/releases/download/v0.14.1/phui-darwin-x64.tar.gz"
      sha256 "54c2a8229def11263287d1d54cc7292e4d30874fd7e0d76694265f30cb6f2d7e"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/phall1/phui/releases/download/v0.14.1/phui-linux-arm64.tar.gz"
      sha256 "0208d4842b51fae345d7fe2a97ae696e8c4096bc76861c0ab82eaece214816fe"
    else
      url "https://github.com/phall1/phui/releases/download/v0.14.1/phui-linux-x64.tar.gz"
      sha256 "412131c9b96f501aa4cea079a0b6027174c729bf3632be6f5ef9c940a8741216"
    end
  end

  def install
    bin.install "phui"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/phui --version")
  end
end
