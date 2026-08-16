# homebrew-tap

Homebrew tap for phall1's tools.

```sh
brew tap phall1/tap
```

| Package | What |
|---|---|
| [`blackbird`](Formula/blackbird.rb) | Durable local-first coordination for human and AI agent work |
| [`phux`](Formula/phux.rb) | Libghostty-backed terminal control plane (not tmux) |
| [`phux-cockpit`](Casks/phux-cockpit.rb) | Native companion for the phux terminal control plane |
| [`phui`](Formula/phui.rb) | Terminal UI for GitHub pull requests, issues, diffs, and Actions |
| [`phbv`](Casks/phbv.rb) | Terminal UI for beads (bd) issue tracking |
| [`token-tach`](Casks/token-tach.rb) | Menu-bar tachometer for AI coding-agent token usage and subscription limits |

```sh
brew install phall1/tap/blackbird
brew install phall1/tap/phux
brew install --cask phall1/tap/phux-cockpit
brew install phall1/tap/phui
brew install --cask phall1/tap/phbv
brew install --cask phall1/tap/token-tach
```

Upgrade everything later with `brew update && brew upgrade`.

Migrating from the legacy `phall1/phux` tap:

```sh
brew tap phall1/tap
brew reinstall phall1/tap/phux
brew untap phall1/phux
```

Every formula and cask here is generated and release-verified by CI — see
[`docs/ARCHITECTURE.md`](docs/ARCHITECTURE.md) for how updates land, what
"verified" means, and how to add a package.
