class Ghui < Formula
  desc "Terminal UI for GitHub pull requests, issues, diffs, and Actions"
  homepage "https://github.com/phall1/ghui"
  version "0.11.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/phall1/ghui/releases/download/v0.11.0/ghui-darwin-arm64.tar.gz"
      sha256 "0589824a46245078f48b55004869261eeeaa08e56a87eb02d77381d9a96ee759"
    else
      url "https://github.com/phall1/ghui/releases/download/v0.11.0/ghui-darwin-x64.tar.gz"
      sha256 "c30d782b0994c0c7a4d04deff670c604776d79ba5c7f2e2cd3a441dfd7a13db8"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/phall1/ghui/releases/download/v0.11.0/ghui-linux-arm64.tar.gz"
      sha256 "de48efd481c64cc0fe8b9a87409f44935c1ad5b1f663b0e9337227a193f609a0"
    else
      url "https://github.com/phall1/ghui/releases/download/v0.11.0/ghui-linux-x64.tar.gz"
      sha256 "ce9c03b1ebe1de749ae165188203f015020540043e191e8b455b14e4a30010e5"
    end
  end

  def install
    bin.install "ghui"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/ghui --version")
  end
end
