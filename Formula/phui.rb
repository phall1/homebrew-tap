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
      sha256 "e0d79a418c63425553339b1dcfa187975ed59de7cc6d9743013937a1b8f68d85"
    else
      url "https://github.com/phall1/phui/releases/download/v0.14.1/phui-darwin-x64.tar.gz"
      sha256 "23949176cdf23c5d11f839ee9a83ce07cb0a198e60731323a50307a114079974"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/phall1/phui/releases/download/v0.14.1/phui-linux-arm64.tar.gz"
      sha256 "55d77c8b758a18ce5350d32a473415c4609f1fc8388ecd5cae93deac7a268738"
    else
      url "https://github.com/phall1/phui/releases/download/v0.14.1/phui-linux-x64.tar.gz"
      sha256 "d2fdfbf1a822051063cdacf1823400ddbdeb3637ffc0bfa3fc322eba5070c47a"
    end
  end

  def install
    bin.install "phui"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/phui --version")
  end
end
