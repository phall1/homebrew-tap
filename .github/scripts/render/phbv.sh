#!/usr/bin/env bash
# Renders Casks/phbv.rb from the values resolve-release.sh exported.
set -euo pipefail

out="${1:?usage: phbv.sh <out-file>}"
: "${VERSION:?}" "${DARWIN_ARM64_SHA256:?}" "${DARWIN_AMD64_SHA256:?}" "${LINUX_ARM64_SHA256:?}" "${LINUX_AMD64_SHA256:?}"

cat > "$out" <<RUBY
# Generated from tools/phbv.json. Do not edit by hand.
cask "phbv" do
  version "${VERSION}"

  on_macos do
    on_arm do
      sha256 "${DARWIN_ARM64_SHA256}"
      url "https://github.com/phall1/phbv/releases/download/v#{version}/phbv_darwin_arm64.tar.gz"
    end
    on_intel do
      sha256 "${DARWIN_AMD64_SHA256}"
      url "https://github.com/phall1/phbv/releases/download/v#{version}/phbv_darwin_amd64.tar.gz"
    end
  end
  on_linux do
    on_arm do
      sha256 "${LINUX_ARM64_SHA256}"
      url "https://github.com/phall1/phbv/releases/download/v#{version}/phbv_linux_arm64.tar.gz"
    end
    on_intel do
      sha256 "${LINUX_AMD64_SHA256}"
      url "https://github.com/phall1/phbv/releases/download/v#{version}/phbv_linux_amd64.tar.gz"
    end
  end

  name "phbv"
  desc "Terminal UI for beads (bd) issue tracking"
  homepage "https://github.com/phall1/phbv"

  livecheck do
    url :url
    strategy :github_latest
  end

  binary "phbv"

  postflight do
    system_command "/usr/bin/xattr", args: ["-dr", "com.apple.quarantine", "#{staged_path}/phbv"] if OS.mac?
  end
end
RUBY
