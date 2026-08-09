# homebrew-tap

Homebrew tap for phall1's tools.

```sh
brew tap phall1/tap
```

| Package | What |
|---|---|
| [`phux-cockpit`](Casks/phux-cockpit.rb) | Native companion for the phux terminal control plane |
| [`token-tach`](Casks/token-tach.rb) | Menu-bar tachometer for AI coding-agent token usage and subscription limits |
| [`phbv`](Casks/phbv.rb) | Terminal UI for beads (bd) issue tracking |
| [`phui`](Formula/phui.rb) | Terminal UI for GitHub pull requests, issues, diffs, and Actions |
| [`phux`](Formula/phux.rb) | Libghostty-backed terminal control plane (not tmux) |

```sh
brew install --cask phall1/tap/phux-cockpit
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

## How updates happen

Every formula and cask here is **generated**. Do not edit the files in
`Formula/` or `Casks/` by hand — the next update will overwrite you, and CI will
fail before that because it re-renders every package and diffs the result.

One workflow, [`update-packages.yml`](.github/workflows/update-packages.yml),
maintains all of them:

1. A source repository publishes a release and dispatches this repository
   (event type `tap-release` with `client_payload.tool`, or the older
   per-tool `<tool>-release`, both of which route to the same place).
   `schedule` also runs hourly, so a release still lands within the hour if a
   dispatch never arrives.
2. [`resolve-release.sh`](.github/scripts/resolve-release.sh) resolves that
   tool's latest release and verifies every artifact.
3. `.github/scripts/render/<tool>.sh` renders the formula or cask.
4. [`commit-update.sh`](.github/scripts/commit-update.sh) commits it, rebasing
   and retrying if another update raced it.

### What "verified" means

`resolve-release.sh` is the only copy of these rules, and a package cannot opt
out of them. Every artifact must match **exactly one** asset on the release by
name, have a `browser_download_url` byte-equal to the canonical
`https://github.com/<repo>/releases/download/<tag>/<name>`, and hash to 64
lowercase hex after download. A manifest may additionally require the digest
agree with what the release itself published — per artifact
(`"sidecar": true` → `<name>.sha256`) or through one combined file
(`"sums": "SHA256SUMS"`). Those checksum files are fetched through the same
checks, because a checksum from an unpinned URL proves nothing.

### Adding a package

Two files, no YAML:

1. **`tools/<name>.json`** — the manifest:

   ```json
   {
     "tool": "example",
     "repo": "phall1/example",
     "path": "Formula/example.rb",
     "message": "Brew formula update for example",
     "assets": {
       "DARWIN_ARM64": { "name": "example-darwin-arm64.tar.gz" },
       "LINUX_X64":    { "name": "example-{version}-linux-x64.tar.gz" }
     }
   }
   ```

   Asset names may use `{tag}` (`v1.2.3`) and `{version}` (`1.2.3`). Add
   `"required": false` to an asset the project does not always ship — it is then
   skipped when absent, and the renderer decides what to do without it. At least
   one asset must always resolve.

2. **`.github/scripts/render/<name>.sh`** — reads `TAG`, `VERSION`, and one
   `<KEY>_SHA256` per resolved asset from the environment, and writes the file
   given as `$1`. Test presence of an optional asset with `${KEY_SHA256:-}`.
   Renderers also get `$DIST` (the downloaded artifacts, each with a `.sha256`
   beside it) and `$RELEASE_JSON` (the raw release payload) for anything more
   involved — `phux-cockpit` reads the release body to decide whether the build
   was notarized.

That is all. The hourly matrix, the dispatch routing, and CI pick the package up
from the manifest.

### Checking your work

```sh
bash .github/scripts/update-tool.sh <tool> /tmp/out.rb   # render without committing
bash .github/scripts/verify-renders.sh                   # every package still reproduces
bash .github/scripts/test/all.sh                         # selection, verification, add-a-package
```

`verify-renders.sh` re-renders every package from the release pinned in the
committed formula or cask and diffs the result. It runs in CI on every push and
pull request: a red run means a generated file was hand-edited or a pinned
release's assets changed. The scheduled update workflow separately discovers
new releases.
