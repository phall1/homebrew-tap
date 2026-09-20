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
      url "https://github.com/phall1/phui/releases/download/v0.18.2/phui-darwin-arm64.tar.gz"
      sha256 "4a9ec34a3d8c9f95416691da43fb78c26bf0074fc2f5493e3eca55f72234e9c1"
    else
      url "https://github.com/phall1/phui/releases/download/v0.18.2/phui-darwin-x64.tar.gz"
      sha256 "2369335318a52e94fe9240a30c894630de7ea1a0fb1d5d72d5c1aff16ae5e601"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/phall1/phui/releases/download/v0.18.2/phui-linux-arm64.tar.gz"
      sha256 "0a284a7f79f6b80977835ebbdecbb6b4971837fd5b0d100cb62f19afde4a61fd"
    else
      url "https://github.com/phall1/phui/releases/download/v0.18.2/phui-linux-x64.tar.gz"
      sha256 "925bb6814dbe771914be8b50a18fdfa62b5a02262479524af1c811eca75b412f"
    end
  end

  def install
    bin.install "phui"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/phui --version")
  end
end
