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
      url "https://github.com/phall1/phui/releases/download/v0.18.1/phui-darwin-arm64.tar.gz"
      sha256 "f219bb03c159ec17299dbd22b0dca91f0b3bd4a08d0406c6750b3b0ac6c56f37"
    else
      url "https://github.com/phall1/phui/releases/download/v0.18.1/phui-darwin-x64.tar.gz"
      sha256 "7163b194b84e38db22d3674fb674f4cd35e85544974f6e54f65716f31f5257d5"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/phall1/phui/releases/download/v0.18.1/phui-linux-arm64.tar.gz"
      sha256 "785e48da1eafc2bfc1c66cc528f7ab50ed7a5ec44093ceec76e2316f4abe49ad"
    else
      url "https://github.com/phall1/phui/releases/download/v0.18.1/phui-linux-x64.tar.gz"
      sha256 "b8b91967ae90ccda0e3bcb53544bcf2d92559341240af24e74331023fea86989"
    end
  end

  def install
    bin.install "phui"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/phui --version")
  end
end
