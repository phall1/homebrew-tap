# This file is maintained by .github/workflows/update-phux-cockpit.yml.
cask "phux-cockpit" do
  version "0.2.0"
  sha256 "739fffe902b9e5eacf3792018330c7c1118b054b572a4da586f5456dd3dd5201"

  url "https://github.com/phall1/phux-cockpit/releases/download/v#{version}/phux-cockpit-#{version}-macos-arm64.zip",
      verified: "github.com/phall1/phux-cockpit/"
  name "Phux Cockpit"
  desc "Native companion for the phux terminal control plane"
  homepage "https://github.com/phall1/phux-cockpit"

  livecheck do
    url :url
    strategy :github_latest
  end

  depends_on arch: :arm64
  depends_on macos: :big_sur
  depends_on formula: "phall1/tap/phux"

  app "Phux Cockpit.app"

  postflight do
    system_command "/usr/bin/xattr",
                   args: ["-dr", "com.apple.quarantine", "#{appdir}/Phux Cockpit.app"],
                   sudo: false
  end

  caveats <<~EOS
    Phux Cockpit runs the installed phux TUI in its Workspace pane and an
    ephemeral local shell beside it. Workspace state is managed by phux;
    Local Shell history is not restored when the app restarts.

    This release is ad-hoc signed and not Apple-notarized. The cask clears
    its quarantine attribute so macOS can launch it without a Developer ID
    certificate.
  EOS
end
