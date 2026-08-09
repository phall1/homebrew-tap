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
      sha256 "1d1fa88f58f1fb8b4531cf68ad7e897caa841e261b310f6bc2b16c5e60c7e337"
    else
      url "https://github.com/phall1/phui/releases/download/v0.14.1/phui-darwin-x64.tar.gz"
      sha256 "dff25d60dfd2e9195f6cb28783d947813ea882f29212bdf446d07ab20539f9e9"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/phall1/phui/releases/download/v0.14.1/phui-linux-arm64.tar.gz"
      sha256 "12096011480ea9e8d817340503a2bf26522cc0e2947e04906e204409372ee021"
    else
      url "https://github.com/phall1/phui/releases/download/v0.14.1/phui-linux-x64.tar.gz"
      sha256 "ea7ca890cd620e85e3333de874dfbe45d6164c2841fbc39e8f63081edd9c558c"
    end
  end

  def install
    bin.install "phui"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/phui --version")
  end
end
