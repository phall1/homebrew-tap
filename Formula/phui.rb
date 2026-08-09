class Phui < Formula
  desc "Terminal UI for GitHub pull requests, issues, diffs, and Actions"
  homepage "https://github.com/phall1/phui"

  livecheck do
    url :stable
    strategy :github_latest
  end

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/phall1/phui/releases/download/v0.13.0/phui-darwin-arm64.tar.gz"
      sha256 "c503cf8923cb9bc74c64347751a9c7d23f3738a130eb64b997061a2bf29a336b"
    else
      url "https://github.com/phall1/phui/releases/download/v0.13.0/phui-darwin-x64.tar.gz"
      sha256 "87ea9d0f3d5c4e17e54bbb43270ec40f38a5c96400d4e02f67c9401cf2427976"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/phall1/phui/releases/download/v0.13.0/phui-linux-arm64.tar.gz"
      sha256 "bff187c62dfc027ab4802837f47287e2421efd4ee2a6e1faf435f077628d2556"
    else
      url "https://github.com/phall1/phui/releases/download/v0.13.0/phui-linux-x64.tar.gz"
      sha256 "d04642c4df7fcc3b3648a237092eefdd4fe96cff01f7e1d44543584ca1774802"
    end
  end

  def install
    bin.install "phui"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/phui --version")
  end
end
