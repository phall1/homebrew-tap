# homebrew-tap

Homebrew tap for phall1's tools.

```sh
brew tap phall1/tap
```

| Package | What |
|---|---|
| [`token-tach`](Casks/token-tach.rb) | Menu-bar tachometer for AI coding-agent token usage and subscription limits |
| [`phbv`](Casks/phbv.rb) | Terminal UI for beads (bd) issue tracking |
| [`phui`](Formula/phui.rb) | Terminal UI for GitHub pull requests, issues, diffs, and Actions |
| [`phux`](Formula/phux.rb) | Libghostty-backed terminal control plane (not tmux) |

```sh
brew install --cask phall1/tap/token-tach
brew install --cask phall1/tap/phbv
brew install phall1/tap/phui
brew install phall1/tap/phux
```

If you installed phux from the legacy `phall1/phux` tap, migrate with:

```sh
brew tap phall1/tap
brew reinstall phall1/tap/phux
brew untap phall1/phux
```

Upgrade everything later with `brew update && brew upgrade`.

Each package has a Homebrew-native `livecheck`, and CI runs
`brew test-bot --only-tap-syntax`. Release discovery through the GitHub API
happens only in this repository's Actions workflows; users do not need the
`gh` CLI to install or upgrade these packages.
