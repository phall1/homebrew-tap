# Generated from tools/phig.json. Do not edit by hand.
class Phig < Formula
  desc "Fast, focused terminal Git history and diff browser"
  homepage "https://github.com/phall1/phig"
  license any_of: ["MIT", "Apache-2.0"]

  livecheck do
    url :stable
    strategy :github_latest
  end

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/phall1/phig/releases/download/v1.6.0/phig-cli-aarch64-apple-darwin.tar.xz"
      sha256 "b5a8bea6d6e33b9f9f9751087224dc442e1c2c825fc46dcdda240eff5da1bfcb"
    else
      url "https://github.com/phall1/phig/releases/download/v1.6.0/phig-cli-x86_64-apple-darwin.tar.xz"
      sha256 "3019cc2b62b74a99cf73f2af9fa8e109381bbbfd8040a43267c66ca7527af057"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/phall1/phig/releases/download/v1.6.0/phig-cli-aarch64-unknown-linux-gnu.tar.xz"
      sha256 "368f8e2096449c862b37ac6af7902bdc432bad4b7eef2af83b4326b08dabbdfe"
    else
      url "https://github.com/phall1/phig/releases/download/v1.6.0/phig-cli-x86_64-unknown-linux-gnu.tar.xz"
      sha256 "362bd7396fe0e8469faaefaa9c6ca405b3a62dc46ef17e6fa11375e710084ff5"
    end
  end

  def install
    bin.install "phig"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/phig --version")
  end
end
