#!/usr/bin/env bash
#
# Prove the generated pipeline reproduces what is committed.
#
# For every tools/*.json: resolve the tool's current latest release, render it
# to a temporary file, and diff against the committed formula or cask. A clean
# run means the generic path and the five hand-written workflows it replaced
# agree byte for byte on live data — which is the only evidence worth having
# that the migration changed nothing.
#
# It stays useful after the migration for a different reason: a run that differs
# means either the tap drifted from its own generator, or a release moved and
# nothing has picked it up yet. Both are worth a red build.
#
# Usage: verify-renders.sh [tool ...]     (default: every manifest)

set -euo pipefail

root="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$root"

tools=("$@")
if (( ${#tools[@]} == 0 )); then
	for manifest in tools/*.json; do
		tools+=("$(basename "$manifest" .json)")
	done
fi

work="$(mktemp -d)"
trap 'rm -rf "$work"' EXIT

failed=()
for tool in "${tools[@]}"; do
	path="$(jq -er '.path' "tools/$tool.json")"
	rendered="$work/$tool.rb"

	if ! bash .github/scripts/update-tool.sh "$tool" "$rendered" >/dev/null; then
		echo "FAIL $tool — render failed" >&2
		failed+=("$tool")
		continue
	fi

	if diff -u "$path" "$rendered" > "$work/$tool.diff"; then
		echo "ok   $tool — $path matches"
	else
		echo "FAIL $tool — $path differs from a fresh render:" >&2
		cat "$work/$tool.diff" >&2
		failed+=("$tool")
	fi
done

if (( ${#failed[@]} > 0 )); then
	echo >&2
	echo "error: ${#failed[@]} of ${#tools[@]} did not match: ${failed[*]}" >&2
	exit 1
fi

echo
echo "All ${#tools[@]} packages reproduce byte for byte."
