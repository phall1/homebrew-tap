# homebrew-tap

Homebrew tap for phall1's tools other than Phux.

```sh
brew tap phall1/tap
```

| Package | What |
|---|---|
| [`blackbird`](Formula/blackbird.rb) | Durable local-first coordination for human and AI agent work |
| [`friday`](Casks/friday.rb) | Private, on-device macOS dictation for Apple Silicon |
| [`phui`](Formula/phui.rb) | Terminal UI for GitHub pull requests, issues, diffs, and Actions |
| [`phbv`](Casks/phbv.rb) | Terminal UI for beads (bd) issue tracking |
| [`token-tach`](Casks/token-tach.rb) | Menu-bar tachometer for AI coding-agent token usage and subscription limits |

```sh
brew install phall1/tap/blackbird
brew install --cask phall1/tap/friday
brew install phall1/tap/phui
brew install --cask phall1/tap/phbv
brew install --cask phall1/tap/token-tach
```

Upgrade everything later with `brew update && brew upgrade`.

Phux and Phux Cockpit moved to [`no-phux/tap`](https://github.com/no-phux/homebrew-tap):

```sh
brew trust --tap no-phux/tap # Homebrew 6+
brew tap no-phux/tap
brew reinstall no-phux/tap/phux
brew reinstall --cask no-phux/tap/phux-cockpit
```

Keep `phall1/tap` installed for the other packages listed above.

Every formula and cask here is generated and release-verified by CI — see
[`docs/ARCHITECTURE.md`](docs/ARCHITECTURE.md) for how updates land, what
"verified" means, and how to add a package.
