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
      url "https://github.com/phall1/phig/releases/download/v1.5.0/phig-cli-aarch64-apple-darwin.tar.xz"
      sha256 "4f880ccbbe1257c05f14a7621ed23b29396976442729cd974ba0ae3ccc662334"
    else
      url "https://github.com/phall1/phig/releases/download/v1.5.0/phig-cli-x86_64-apple-darwin.tar.xz"
      sha256 "98312a3407f00a339fdb1538d6ba6976eb7c619cbca9d01ccb5acf7989770be3"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/phall1/phig/releases/download/v1.5.0/phig-cli-aarch64-unknown-linux-gnu.tar.xz"
      sha256 "9dfdf02b636053e24388a5202eba0f9545b6bd9abb4da2d64e39fe8fb9f6f173"
    else
      url "https://github.com/phall1/phig/releases/download/v1.5.0/phig-cli-x86_64-unknown-linux-gnu.tar.xz"
      sha256 "22b00069bd222d75a2b04487a37da1fd176135ee333ed6b4d3b69acf26e56ed7"
    end
  end

  def install
    bin.install "phig"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/phig --version")
  end
end
