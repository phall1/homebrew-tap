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
      url "https://github.com/phall1/phui/releases/download/v0.15.0/phui-darwin-arm64.tar.gz"
      sha256 "b1f41f9815ba1e3b82a21ad9635e59dc4c56378f3a475c82b0b90c13cd88182e"
    else
      url "https://github.com/phall1/phui/releases/download/v0.15.0/phui-darwin-x64.tar.gz"
      sha256 "d5fedac97f075e90dac427bb50e3af0ad5757f51f4c7e11d208d3f024723ad63"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/phall1/phui/releases/download/v0.15.0/phui-linux-arm64.tar.gz"
      sha256 "3f11abeb41fc2941abaa521521d8ca07c8981f0dc5fd41c29ea5747d003a31e7"
    else
      url "https://github.com/phall1/phui/releases/download/v0.15.0/phui-linux-x64.tar.gz"
      sha256 "124908e1436fda82ae36dd7658a17fe4092e52745ec14c7a7ad346198dd8e2f1"
    end
  end

  def install
    bin.install "phui"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/phui --version")
  end
end
