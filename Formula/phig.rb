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
      url "https://github.com/phall1/phig/releases/download/v1.1.1/phig-cli-aarch64-apple-darwin.tar.xz"
      sha256 "4001b319208fd1e6f02a7a886759bc02bc668bee9b80a47eaca28b373882356d"
    else
      url "https://github.com/phall1/phig/releases/download/v1.1.1/phig-cli-x86_64-apple-darwin.tar.xz"
      sha256 "6db2e196f4a9ed0ec62805610fd3676daf0096202a14a9e6255f07e79531f8f4"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/phall1/phig/releases/download/v1.1.1/phig-cli-aarch64-unknown-linux-gnu.tar.xz"
      sha256 "a25c9266ba07ab981a5f0ce669686eed60326e314cc5e58de1f5d2b6f5758347"
    else
      url "https://github.com/phall1/phig/releases/download/v1.1.1/phig-cli-x86_64-unknown-linux-gnu.tar.xz"
      sha256 "c2cf4f2a7d96f922cc75052817165a48d4db60ea8d73440c63ea424dd9446af7"
    end
  end

  def install
    bin.install "phig"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/phig --version")
  end
end
