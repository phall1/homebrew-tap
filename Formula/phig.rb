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
      url "https://github.com/phall1/phig/releases/download/v1.3.0/phig-cli-aarch64-apple-darwin.tar.xz"
      sha256 "7eb70ecee75908c934e9ce54122722bc937d7ff493a9cd3b544d095eda10ffe8"
    else
      url "https://github.com/phall1/phig/releases/download/v1.3.0/phig-cli-x86_64-apple-darwin.tar.xz"
      sha256 "d5787edf36be17e42d07e9f07ee0470b5c8f2b68e4823812da074fc3abacfe14"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/phall1/phig/releases/download/v1.3.0/phig-cli-aarch64-unknown-linux-gnu.tar.xz"
      sha256 "2dd00a3979667b6f162e149a18a712c5edea44e7c4762d4ae9d5942433af2336"
    else
      url "https://github.com/phall1/phig/releases/download/v1.3.0/phig-cli-x86_64-unknown-linux-gnu.tar.xz"
      sha256 "4da24dbb63d6a8698418f1d5c902ae0374fa38547d35338fd62f48dd9f856c31"
    end
  end

  def install
    bin.install "phig"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/phig --version")
  end
end
