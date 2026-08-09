#!/usr/bin/env bash
# Renders Formula/phui.rb. Reads TAG and the *_SHA256 values resolve-release.sh
# exported; writes to $1.
set -euo pipefail

out="${1:?usage: phui.sh <out-file>}"
: "${TAG:?}" "${DARWIN_ARM64_SHA256:?}" "${DARWIN_X64_SHA256:?}" "${LINUX_ARM64_SHA256:?}" "${LINUX_X64_SHA256:?}"

cat > "$out" <<RUBY
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
      url "https://github.com/phall1/phui/releases/download/${TAG}/phui-darwin-arm64.tar.gz"
      sha256 "${DARWIN_ARM64_SHA256}"
    else
      url "https://github.com/phall1/phui/releases/download/${TAG}/phui-darwin-x64.tar.gz"
      sha256 "${DARWIN_X64_SHA256}"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/phall1/phui/releases/download/${TAG}/phui-linux-arm64.tar.gz"
      sha256 "${LINUX_ARM64_SHA256}"
    else
      url "https://github.com/phall1/phui/releases/download/${TAG}/phui-linux-x64.tar.gz"
      sha256 "${LINUX_X64_SHA256}"
    end
  end

  def install
    bin.install "phui"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/phui --version")
  end
end
RUBY
