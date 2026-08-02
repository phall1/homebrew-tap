#!/usr/bin/env bash
set -euo pipefail

root="$(cd "$(dirname "$0")/../.." && pwd)"
cask="$root/Casks/phux-cockpit.rb"
tmp="$(mktemp -d "${TMPDIR:-/tmp}/phux-cockpit-cask-check.XXXXXX")"
trap 'rm -rf "$tmp"' EXIT

version="$(awk -F'"' '/^  version "/ { print $2; exit }' "$cask")"
sha256="$(awk -F'"' '/^  sha256 "/ { print $2; exit }' "$cask")"
[[ "$version" =~ ^[0-9]+\.[0-9]+\.[0-9]+$ ]]
[[ "$sha256" =~ ^[0-9a-f]{64}$ ]]
notarized=true
if grep -Fq '  postflight do' "$cask"; then
  notarized=false
fi

bash "$root/.github/scripts/gen-phux-cockpit-cask.sh" "v$version" "$sha256" "$notarized" "$tmp/phux-cockpit.rb" >/dev/null
if ! cmp -s "$cask" "$tmp/phux-cockpit.rb"; then
  echo "Casks/phux-cockpit.rb does not match its generator" >&2
  diff -u "$cask" "$tmp/phux-cockpit.rb" >&2 || true
  exit 1
fi

if bash "$root/.github/scripts/gen-phux-cockpit-cask.sh" "v$version" not-a-checksum "$notarized" "$tmp/invalid.rb" >/dev/null 2>&1; then
  echo "gen-phux-cockpit-cask.sh accepted a malformed checksum" >&2
  exit 1
fi

echo "Phux Cockpit cask regeneration check passed"
