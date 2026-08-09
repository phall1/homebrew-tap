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
      sha256 "3c28783241717519f47e41a7cafabb0ec931b43059405fc96f495976138c01d2"
    else
      url "https://github.com/phall1/phui/releases/download/v0.14.1/phui-darwin-x64.tar.gz"
      sha256 "3bb841f35ff1ed02a527181904934b4d0e3005abb64c79b467a61176d29827e1"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/phall1/phui/releases/download/v0.14.1/phui-linux-arm64.tar.gz"
      sha256 "e4ce2724ee07951ea20611c30a6f3386db2ddbc57b5e54dfae6654cda67647bf"
    else
      url "https://github.com/phall1/phui/releases/download/v0.14.1/phui-linux-x64.tar.gz"
      sha256 "40153ffa18c5a042eea344a8e683d983d5b599aa6341841d78b4013ebaac6098"
    end
  end

  def install
    bin.install "phui"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/phui --version")
  end
end
