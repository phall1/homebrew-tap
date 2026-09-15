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
      url "https://github.com/phall1/phui/releases/download/v0.17.1/phui-darwin-arm64.tar.gz"
      sha256 "a7da865a53e522451c14508ae93de6ac60c939b3fece6fbaba6dccc4f1dba55e"
    else
      url "https://github.com/phall1/phui/releases/download/v0.17.1/phui-darwin-x64.tar.gz"
      sha256 "f7781db13ae9e094d530ed359e22f359ca0461f52b547feabe0d278ba9591ba1"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/phall1/phui/releases/download/v0.17.1/phui-linux-arm64.tar.gz"
      sha256 "89b0d0ee3e61e3c3b9790f11eeb5474335edf9a9fbfc7d33640bb1112edbe22b"
    else
      url "https://github.com/phall1/phui/releases/download/v0.17.1/phui-linux-x64.tar.gz"
      sha256 "19b6b046d0914a39e1711c0f74d7bc0e29189f86ed795125d6a3226210e9b7c6"
    end
  end

  def install
    bin.install "phui"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/phui --version")
  end
end
