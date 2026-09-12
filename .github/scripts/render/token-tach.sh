#!/usr/bin/env bash
# Renders Casks/token-tach.rb from the values resolve-release.sh exported.
set -euo pipefail

out="${1:?usage: token-tach.sh <out-file>}"
: "${VERSION:?}" "${DMG_SHA256:?}"

cat > "$out" <<RUBY
# Generated from tools/token-tach.json. Do not edit by hand.
cask "token-tach" do
  version "${VERSION}"
  sha256 "${DMG_SHA256}"

  url "https://github.com/phall1/token-tach/releases/download/v#{version}/token-tach-#{version}-universal2.dmg"
  name "Token Tach"
  desc "Menu-bar tachometer for AI coding-agent token usage and subscription limits"
  homepage "https://github.com/phall1/token-tach"

  livecheck do
    url :url
    strategy :github_latest
  end

  depends_on macos: :big_sur

  app "Token Tach.app", target: "token-tach.app"
  binary "#{staged_path}/token-tach-shim", target: "token-tach"

  preflight_steps do
    write_file "token-tach-shim", <<~SH
      #!/bin/sh
      exec "{{appdir}}/token-tach.app/Contents/MacOS/token-tach" "\$@"
    SH
    set_permissions "token-tach-shim", "0755"
  end

  postflight_steps do
    run "/usr/bin/xattr",
        args: ["-dr", "com.apple.quarantine", "{{appdir}}/token-tach.app"]
  end

  zap trash: [
    "~/.config/token-tach",
    "~/.local/state/token-tach",
  ]

  caveats <<~EOS
    Token Tach is a menu-bar accessory app with no Dock icon.
    Launch it from Applications, then use its menu-bar item.

    This build is ad-hoc signed. The cask clears its quarantine flag
    so macOS can launch it without a Developer ID certificate.
  EOS
end
RUBY
