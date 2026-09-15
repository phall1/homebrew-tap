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
      url "https://github.com/phall1/phui/releases/download/v0.17.0/phui-darwin-arm64.tar.gz"
      sha256 "98943b51999e86ce60cfb565f31293a5381623df12518e80989367c65cbd308b"
    else
      url "https://github.com/phall1/phui/releases/download/v0.17.0/phui-darwin-x64.tar.gz"
      sha256 "23e5b673695c49eed3ca65c5ba5dd163cf8610c8f7d00c5cfc8e2798ecabfce7"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/phall1/phui/releases/download/v0.17.0/phui-linux-arm64.tar.gz"
      sha256 "92221ca8fdaf635f86cca2ecae7456750ec16b8b9349f2d70c82a8b446296e13"
    else
      url "https://github.com/phall1/phui/releases/download/v0.17.0/phui-linux-x64.tar.gz"
      sha256 "4b5003b14ed3f275d54edea3dee67bf7f1ef47b9d2acecca34384b0f9bc87d3d"
    end
  end

  def install
    bin.install "phui"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/phui --version")
  end
end
