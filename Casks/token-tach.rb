cask "token-tach" do
  version "0.9.5"
  sha256 "1a3f4a82657c63855ea911eb03bca5f62a9478ce2ce2aa6483cbc4f76f6fd5cc"

  url "https://github.com/phall1/token-tach/releases/download/v#{version}/token-tach-#{version}-universal2.dmg",
      verified: "github.com/phall1/token-tach/"
  name "Token Tach"
  desc "Menu-bar tachometer for AI coding-agent token usage and subscription limits"
  homepage "https://github.com/phall1/token-tach"

  livecheck do
    url :url
    strategy :github_latest
  end

  depends_on macos: :big_sur

  app "token-tach.app"
  binary "#{staged_path}/token-tach-shim", target: "token-tach"

  preflight do
    shim = staged_path/"token-tach-shim"
    shim.write <<~SH
      #!/bin/sh
      exec "#{appdir}/token-tach.app/Contents/MacOS/token-tach" "$@"
    SH
    shim.chmod 0755
  end

  postflight do
    system_command "/usr/bin/xattr",
                   args: ["-dr", "com.apple.quarantine", "#{appdir}/token-tach.app"],
                   sudo: false
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
