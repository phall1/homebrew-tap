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
      url "https://github.com/phall1/phui/releases/download/v0.14.0/phui-darwin-arm64.tar.gz"
      sha256 "9063214d8b8a9e7f2ee465583078a58d0a6b35ba7c7b1740b06097d75dcd1007"
    else
      url "https://github.com/phall1/phui/releases/download/v0.14.0/phui-darwin-x64.tar.gz"
      sha256 "2f5fe176024cc919c00ed4ab48e1b466025d6425eed78956c4fd7ee67827d8fc"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/phall1/phui/releases/download/v0.14.0/phui-linux-arm64.tar.gz"
      sha256 "039ca8de5f3d1e28ab5addf95ce83c2eb6a897cee92138406ea06dd1d9886bda"
    else
      url "https://github.com/phall1/phui/releases/download/v0.14.0/phui-linux-x64.tar.gz"
      sha256 "a7cdee90dc93df0c8b359aae9e1b62607215a14b6fb6d21654c3abf3a6318c2e"
    end
  end

  def install
    bin.install "phui"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/phui --version")
  end
end
