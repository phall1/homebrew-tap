#!/usr/bin/env bash
# Renders Formula/blackbird.rb from the verified release assets.
set -euo pipefail

out="${1:?usage: blackbird.sh <out-file>}"
: "${TAG:?}" "${DARWIN_ARM64_SHA256:?}" "${LINUX_ARM64_SHA256:?}" "${LINUX_X64_SHA256:?}"

cat > "$out" <<RUBY
# Generated from tools/blackbird.json. Do not edit by hand.
class Blackbird < Formula
  desc "Durable local-first coordination for human and AI agent work"
  homepage "https://github.com/phall1/blackbird"

  livecheck do
    url :stable
    strategy :github_latest
  end

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/phall1/blackbird/releases/download/${TAG}/blackbird-${TAG}-aarch64-apple-darwin.tar.gz"
      sha256 "${DARWIN_ARM64_SHA256}"
    else
      odie "Blackbird currently requires Apple Silicon on macOS"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/phall1/blackbird/releases/download/${TAG}/blackbird-${TAG}-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "${LINUX_ARM64_SHA256}"
    else
      url "https://github.com/phall1/blackbird/releases/download/${TAG}/blackbird-${TAG}-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "${LINUX_X64_SHA256}"
    end
  end

  def install
    bin.install "blackbird", "blackbird-claude", "blackbird-pi"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/blackbird --version")
    assert_match version.to_s, shell_output("#{bin}/blackbird-claude --version")
    assert_match version.to_s, shell_output("#{bin}/blackbird-pi --version")
  end
end
RUBY
