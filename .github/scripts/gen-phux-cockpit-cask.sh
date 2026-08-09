#!/usr/bin/env bash
set -euo pipefail

tag="${1:?usage: gen-phux-cockpit-cask.sh <tag> <sha256> <notarized> [out-file]}"
sha256="${2:?usage: gen-phux-cockpit-cask.sh <tag> <sha256> <notarized> [out-file]}"
notarized="${3:?usage: gen-phux-cockpit-cask.sh <tag> <sha256> <notarized> [out-file]}"
out="${4:-}"

[[ "$tag" =~ ^v(([0-9]+)\.([0-9]+)\.([0-9]+))$ ]]
version="${BASH_REMATCH[1]}"
major="${BASH_REMATCH[2]}"
minor="${BASH_REMATCH[3]}"
spatial_runtime=false
description="Native companion for the phux terminal control plane"
if (( major > 0 || minor >= 3 )); then
  spatial_runtime=true
  description="Native spatial runtime for terminal and web surfaces"
fi
if [ "${#sha256}" -ne 64 ]; then
  echo "error: sha256 must contain exactly 64 lowercase hexadecimal characters" >&2
  exit 1
fi
case "$sha256" in
  *[!0-9a-f]*) echo "error: sha256 contains non-hexadecimal characters" >&2; exit 1 ;;
esac
[[ "$notarized" == true || "$notarized" == false ]]

emit() {
  cat <<EOF
# Generated from tools/phux-cockpit.json. Do not edit by hand.
cask "phux-cockpit" do
  version "${version}"
  sha256 "${sha256}"

  url "https://github.com/phall1/phux-cockpit/releases/download/v#{version}/phux-cockpit-#{version}-macos-arm64.zip",
      verified: "github.com/phall1/phux-cockpit/"
  name "Phux Cockpit"
  desc "${description}"
  homepage "https://github.com/phall1/phux-cockpit"

  livecheck do
    url :url
    strategy :github_latest
  end

  depends_on arch: :arm64
  depends_on macos: :big_sur
EOF

  if [ "$spatial_runtime" == false ]; then
    cat <<'EOF'
  depends_on formula: "phall1/tap/phux"
EOF
  fi

  cat <<'EOF'

  app "Phux Cockpit.app"
EOF

  if [ "$notarized" == false ]; then
    cat <<'EOF'

  postflight do
    system_command "/usr/bin/xattr",
                   args: ["-dr", "com.apple.quarantine", "#{appdir}/Phux Cockpit.app"],
                   sudo: false
  end

  caveats <<~EOS
EOF
    if [ "$spatial_runtime" == true ]; then
      cat <<'EOF'
    Phux Cockpit provides native terminal tabs, split panes, and a focused
    system-WebKit surface. Terminal processes and layout are not restored
    when the app restarts.
EOF
    else
      cat <<'EOF'
    Phux Cockpit runs the installed phux TUI in its Workspace pane and an
    ephemeral local shell beside it. Workspace state is managed by phux;
    Local Shell history is not restored when the app restarts.
EOF
    fi
    cat <<'EOF'

    This release is ad-hoc signed and not Apple-notarized. The cask clears
    its quarantine attribute so macOS can launch it without a Developer ID
    certificate.
  EOS
EOF
  else
    cat <<'EOF'

  caveats <<~EOS
EOF
    if [ "$spatial_runtime" == true ]; then
      cat <<'EOF'
    Phux Cockpit provides native terminal tabs, split panes, and a focused
    system-WebKit surface. Terminal processes and layout are not restored
    when the app restarts.
EOF
    else
      cat <<'EOF'
    Phux Cockpit runs the installed phux TUI in its Workspace pane and an
    ephemeral local shell beside it. Workspace state is managed by phux;
    Local Shell history is not restored when the app restarts.
EOF
    fi
    cat <<'EOF'
  EOS
EOF
  fi

  echo "end"
}

if [ -n "$out" ]; then
  emit > "$out"
  echo "wrote $out" >&2
else
  emit
fi
