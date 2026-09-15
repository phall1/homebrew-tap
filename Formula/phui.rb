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
      url "https://github.com/phall1/phui/releases/download/v0.17.3/phui-darwin-arm64.tar.gz"
      sha256 "a52fde126fd71895596260eaab3cb28ac71462e66e22dad8b1195adaf115f81c"
    else
      url "https://github.com/phall1/phui/releases/download/v0.17.3/phui-darwin-x64.tar.gz"
      sha256 "658c61e0c5e501da937edbe9403539c5beab824632601767336f11f058032d56"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/phall1/phui/releases/download/v0.17.3/phui-linux-arm64.tar.gz"
      sha256 "537e4c41e427e9836d62e2423d676821cca4d93a41c398a2e763cb2a984fbc0d"
    else
      url "https://github.com/phall1/phui/releases/download/v0.17.3/phui-linux-x64.tar.gz"
      sha256 "16f5ee49c895e3c5c001e2d8b8b3b4ea877ec2baaa08d14081df32a99f3ae404"
    end
  end

  def install
    bin.install "phui"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/phui --version")
  end
end
