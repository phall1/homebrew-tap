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
      url "https://github.com/phall1/phig/releases/download/v1.2.0/phig-cli-aarch64-apple-darwin.tar.xz"
      sha256 "899ce7eceefd56316138fb578d1389493b0ff168fec61b848aeff856f76b898c"
    else
      url "https://github.com/phall1/phig/releases/download/v1.2.0/phig-cli-x86_64-apple-darwin.tar.xz"
      sha256 "96cc211399308c3c614f10003f919f69887a9245a5d292babdae25e082a503d8"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/phall1/phig/releases/download/v1.2.0/phig-cli-aarch64-unknown-linux-gnu.tar.xz"
      sha256 "9bbcae938309d5c3459ba65091dbd2aecc43b0a7ab4ba9cc1f59716d3599e221"
    else
      url "https://github.com/phall1/phig/releases/download/v1.2.0/phig-cli-x86_64-unknown-linux-gnu.tar.xz"
      sha256 "7607635d6d89263e7935ac4c54a7a09163027717760756d9721493a77850d89c"
    end
  end

  def install
    bin.install "phig"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/phig --version")
  end
end
