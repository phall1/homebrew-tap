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
      url "https://github.com/phall1/phui/releases/download/v0.16.1/phui-darwin-arm64.tar.gz"
      sha256 "c87ba6ed87fc3af6d2fc8333958eb58da5ec8ebc4baecd4a4549eb49c72e7d14"
    else
      url "https://github.com/phall1/phui/releases/download/v0.16.1/phui-darwin-x64.tar.gz"
      sha256 "012d97a4d72c7ab7329aaa4c4fbfb1cc27f928a50b96ce00aa5f71f3f7f0e9dd"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/phall1/phui/releases/download/v0.16.1/phui-linux-arm64.tar.gz"
      sha256 "8334c370e0f54784250da7f4dfb17655da482fca6d2a10718152911e09969bea"
    else
      url "https://github.com/phall1/phui/releases/download/v0.16.1/phui-linux-x64.tar.gz"
      sha256 "97bc0c2eb74fb131813f5f28f52863fbda99fb210898c54cdf559c8772e84035"
    end
  end

  def install
    bin.install "phui"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/phui --version")
  end
end
