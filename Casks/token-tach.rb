cask "token-tach" do
  version "0.3.2"
  sha256 "092ba733afa122c282b982ab3b2787910aabbefcd4dfc3bb134e944669adfb46"

  url "https://github.com/phall1/token-tach/releases/download/v#{version}/token-tach-#{version}-macos-ReleaseFast.dmg",
      verified: "github.com/phall1/token-tach/"
  name "Token Tach"
  desc "Menu-bar tachometer for AI coding-agent token usage and subscription limits"
  homepage "https://github.com/phall1/token-tach"

  livecheck do
    url :url
    strategy :github_latest
  end

  depends_on macos: :sonoma

  app "token-tach.app"

  # The app is adhoc-signed (not notarized), so Gatekeeper would refuse
  # the quarantined copy Homebrew stages. Clear the flag the same way
  # a user would with right-click -> Open.
  postflight do
    system_command "/usr/bin/xattr",
                   args: ["-dr", "com.apple.quarantine", "#{appdir}/token-tach.app"],
                   sudo: false
  end

  # A shim, not a symlink: executing a signed bundle's binary through a
  # symlink outside the bundle gets killed by amfid (SIGKILL).
  binary "#{staged_path}/token-tach-shim", target: "token-tach"

  preflight do
    shim = staged_path/"token-tach-shim"
    shim.write <<~SH
      #!/bin/sh
      exec "#{appdir}/token-tach.app/Contents/MacOS/token-tach" "$@"
    SH
    shim.chmod 0o755
  end

  zap trash: [
    "~/.config/token-tach",
    "~/.local/state/token-tach",
  ]

  caveats <<~EOS
    token-tach is a menu-bar accessory app: no Dock icon. Launch it with
      open -a token-tach
    then look for the glance in the menu bar. Left-click for the
    instrument, right-click for the menu (Open Tach / Dashboard /
    Settings / Quit).

    The `token-tach` command is linked too, for `--json` / `--statusline`.

    This build is adhoc-signed and NOT notarized: the cask clears the
    quarantine flag for you, which is why macOS does not prompt.
  EOS
end
