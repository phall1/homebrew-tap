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
      url "https://github.com/phall1/phui/releases/download/v0.17.2/phui-darwin-arm64.tar.gz"
      sha256 "a0d96d52a31b7faa62331d60c53666fce8aaef2f27ce42d0750cd6dd527fa096"
    else
      url "https://github.com/phall1/phui/releases/download/v0.17.2/phui-darwin-x64.tar.gz"
      sha256 "ea3edd575b816c8d455683f41b183fe4b14a020dd3d8f2e59858f8cae741c4f8"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/phall1/phui/releases/download/v0.17.2/phui-linux-arm64.tar.gz"
      sha256 "13bedfc34098f600bf917ef881cec8bcaed05464119c91e9a1d9d36b0772a4e9"
    else
      url "https://github.com/phall1/phui/releases/download/v0.17.2/phui-linux-x64.tar.gz"
      sha256 "aebb3b2a5c3d8b9fba3e95ce459b4396607ee7fbb210816a0e9b663caca3bd25"
    end
  end

  def install
    bin.install "phui"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/phui --version")
  end
end
