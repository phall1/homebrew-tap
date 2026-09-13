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
      url "https://github.com/phall1/phui/releases/download/v0.16.0/phui-darwin-arm64.tar.gz"
      sha256 "7850aa420a1b151baa4087c8ced314a6c7fdfaab880d38ef66af11cc63625f03"
    else
      url "https://github.com/phall1/phui/releases/download/v0.16.0/phui-darwin-x64.tar.gz"
      sha256 "adffab3bcd3ca77bb842711e5224fe8c957cf85fd3567e338ca17d5946de2763"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/phall1/phui/releases/download/v0.16.0/phui-linux-arm64.tar.gz"
      sha256 "fec5825ddfeb4cfe87e3abad629f2088151e94236333fe55f1a30b803776b790"
    else
      url "https://github.com/phall1/phui/releases/download/v0.16.0/phui-linux-x64.tar.gz"
      sha256 "a20193308c026d77ef50659dd594fbe3f3dab33de6d4530dc17ee5259a64c038"
    end
  end

  def install
    bin.install "phui"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/phui --version")
  end
end
