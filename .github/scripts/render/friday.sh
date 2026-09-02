#!/usr/bin/env bash
# Renders Casks/friday.rb from the values resolve-release.sh exported.
set -euo pipefail

out="${1:?usage: friday.sh <out-file>}"
: "${VERSION:?}" "${DMG_SHA256:?}"

cat > "$out" <<RUBY
# Generated from tools/friday.json. Do not edit by hand.
cask "friday" do
  version "${VERSION}"
  sha256 "${DMG_SHA256}"

  url "https://github.com/phall1/friday/releases/download/v#{version}/Friday-#{version}-arm64.dmg"
  name "Friday"
  desc "Private, on-device dictation for Apple Silicon"
  homepage "https://github.com/phall1/friday"

  livecheck do
    url :url
    strategy :github_latest
  end

  depends_on arch: :arm64
  depends_on macos: :sonoma

  app "Friday.app"

  postflight do
    system_command "/usr/bin/xattr",
                   args: ["-dr", "com.apple.quarantine", "#{appdir}/Friday.app"],
                   sudo: false
  end

  uninstall quit:       "com.phall.friday",
            login_item: "Friday"

  zap trash: [
    "~/Library/Application Support/com.phall.friday",
    "~/Library/Caches/com.phall.friday",
    "~/Library/Preferences/com.phall.friday.plist",
    "~/Library/Saved Application State/com.phall.friday.savedState",
  ]

  caveats <<~EOS
    Friday is a menu-bar accessory app with no Dock icon.
    Launch it from Applications, then use its menu-bar item.

    This build is Apple Development signed and not Apple-notarized. The cask
    removes the quarantine attribute from /Applications/Friday.app only, so
    macOS can launch this development-signed build without changing global
    Gatekeeper settings.
  EOS
end
RUBY
