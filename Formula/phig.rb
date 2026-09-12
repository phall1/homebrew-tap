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
      url "https://github.com/phall1/phig/releases/download/v1.4.0/phig-cli-aarch64-apple-darwin.tar.xz"
      sha256 "c8f227b8e4e631d1946e76acdca921cb91880a67a7de2e6cfab4ac6fd91e9447"
    else
      url "https://github.com/phall1/phig/releases/download/v1.4.0/phig-cli-x86_64-apple-darwin.tar.xz"
      sha256 "9f0abc817a2fb7130177365dc4a10db7d9580022a35c79ca976ae0414dfcb86c"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/phall1/phig/releases/download/v1.4.0/phig-cli-aarch64-unknown-linux-gnu.tar.xz"
      sha256 "fc6774284c992939de16c73d062c8adaf93a824b774d50f5341aa107e11a0d7f"
    else
      url "https://github.com/phall1/phig/releases/download/v1.4.0/phig-cli-x86_64-unknown-linux-gnu.tar.xz"
      sha256 "712db37b970b64a310702a980420334e8b40b22f7662ce23e7ed44587a096ad8"
    end
  end

  def install
    bin.install "phig"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/phig --version")
  end
end
