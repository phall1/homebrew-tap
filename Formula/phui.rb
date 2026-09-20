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
      url "https://github.com/phall1/phui/releases/download/v0.18.3/phui-darwin-arm64.tar.gz"
      sha256 "5bd3ea621c76cfde28218226c83ed12a9db5ae58826be13cf990ecb622250829"
    else
      url "https://github.com/phall1/phui/releases/download/v0.18.3/phui-darwin-x64.tar.gz"
      sha256 "4f207f2a4f8ca5bb29b3dbe45079bcabc74e4d890cde62f289b965b6f8880f74"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/phall1/phui/releases/download/v0.18.3/phui-linux-arm64.tar.gz"
      sha256 "a2d175779dee01d2bc70cf3e81b297b9985f75295d6633d497617ab4562031b4"
    else
      url "https://github.com/phall1/phui/releases/download/v0.18.3/phui-linux-x64.tar.gz"
      sha256 "7182566d680f91d6cfda668a668eca246ded090430c7aa004b4a6d2894ce7eb3"
    end
  end

  def install
    bin.install "phui"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/phui --version")
  end
end
