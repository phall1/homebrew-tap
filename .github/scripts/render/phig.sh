#!/usr/bin/env bash
# Renders Formula/phig.rb. Reads TAG and the *_SHA256 values resolve-release.sh
# exported; writes to $1.
#
# phig's artifacts carry no version in their filenames, so the formula has no
# version stanza and Homebrew infers one from the tag in the download URL. That
# is the same arrangement phui uses; `brew info` resolves both correctly.
set -euo pipefail

out="${1:?usage: phig.sh <out-file>}"
: "${TAG:?}" "${DARWIN_ARM64_SHA256:?}" "${DARWIN_X64_SHA256:?}" "${LINUX_ARM64_SHA256:?}" "${LINUX_X64_SHA256:?}"

cat > "$out" <<RUBY
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
      url "https://github.com/phall1/phig/releases/download/${TAG}/phig-cli-aarch64-apple-darwin.tar.xz"
      sha256 "${DARWIN_ARM64_SHA256}"
    else
      url "https://github.com/phall1/phig/releases/download/${TAG}/phig-cli-x86_64-apple-darwin.tar.xz"
      sha256 "${DARWIN_X64_SHA256}"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/phall1/phig/releases/download/${TAG}/phig-cli-aarch64-unknown-linux-gnu.tar.xz"
      sha256 "${LINUX_ARM64_SHA256}"
    else
      url "https://github.com/phall1/phig/releases/download/${TAG}/phig-cli-x86_64-unknown-linux-gnu.tar.xz"
      sha256 "${LINUX_X64_SHA256}"
    end
  end

  def install
    bin.install "phig"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/phig --version")
  end
end
RUBY
