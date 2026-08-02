class Phui < Formula
  desc "Terminal UI for GitHub pull requests, issues, diffs, and Actions"
  homepage "https://github.com/phall1/phui"

  livecheck do
    url :stable
    strategy :github_latest
  end

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/phall1/phui/releases/download/v0.12.0/phui-darwin-arm64.tar.gz"
      sha256 "5c2e1f4c938fb80899a975f7421a258c17c5b06b0bb8704d943c79e678d7e33d"
    else
      url "https://github.com/phall1/phui/releases/download/v0.12.0/phui-darwin-x64.tar.gz"
      sha256 "3e435704e78a90b6059acae36a22e81bef9dc6d2a6ebea0172b31a2f034d367a"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/phall1/phui/releases/download/v0.12.0/phui-linux-arm64.tar.gz"
      sha256 "a41054f3ca8d75aca511d1aa3690c9315275ebed00f2dee3ee4b0fc72f4f33a1"
    else
      url "https://github.com/phall1/phui/releases/download/v0.12.0/phui-linux-x64.tar.gz"
      sha256 "a7e7a6673fbbb51a794a8aa4d9425157b96bfe949d0d487913aacea1b834ae3f"
    end
  end

  def install
    bin.install "phui"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/phui --version")
  end
end
