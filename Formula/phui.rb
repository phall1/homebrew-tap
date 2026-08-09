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
      sha256 "8a4a29c72ac59ce5521fe4cbe475fe2f895c0488e57359ea719194d0321d7193"
    else
      url "https://github.com/phall1/phui/releases/download/v0.14.1/phui-darwin-x64.tar.gz"
      sha256 "2525434b12c328780806fa944c79e866866b6c95596ce7d139d2537517bfe99d"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/phall1/phui/releases/download/v0.14.1/phui-linux-arm64.tar.gz"
      sha256 "b884f328a421835adb09f4e3d929de095d9db4c341c271b3029cde5c29ecf5a5"
    else
      url "https://github.com/phall1/phui/releases/download/v0.14.1/phui-linux-x64.tar.gz"
      sha256 "42d01e4bcf42abb19aea814509f381341c0e93fcafde5304f478475c42a1d2ae"
    end
  end

  def install
    bin.install "phui"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/phui --version")
  end
end
