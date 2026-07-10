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

  depends_on macos: ">= :sonoma"

  app "token-tach.app"
  binary "#{appdir}/token-tach.app/Contents/MacOS/token-tach", target: "token-tach"

  zap trash: [
    "~/.config/token-tach",
    "~/.local/state/token-tach",
  ]

  caveats <<~EOS
    token-tach is a menu-bar accessory app: it has no Dock icon.
    Launch it with `open -a token-tach` (or from Spotlight), then look
    for the glance in the menu bar — left-click for the instrument,
    right-click for the menu (Open Tach / Dashboard / Settings / Quit).

    The `token-tach` command is linked too, for `--json` and
    `--statusline`.

    This build is adhoc-signed, not notarized.
  EOS
end
