# Generated from tools/phux-cockpit.json. Do not edit by hand.
cask "phux-cockpit" do
  version "0.16.0"
  sha256 "292bef8ef96ee177d107d630750bcff98fd8aa932bb997fd1e07bfc60d908c14"

  url "https://github.com/no-phux/phux-cockpit/releases/download/v#{version}/phux-cockpit-#{version}-macos-arm64.zip"
  name "Phux Cockpit"
  desc "Native spatial runtime for terminal and web surfaces"
  homepage "https://github.com/no-phux/phux-cockpit"

  livecheck do
    url :url
    strategy :github_latest
  end

  depends_on arch: :arm64
  depends_on macos: :big_sur

  app "Phux Cockpit.app"

  postflight do
    system_command "/usr/bin/xattr",
                   args: ["-dr", "com.apple.quarantine", "#{appdir}/Phux Cockpit.app"],
                   sudo: false
  end

  caveats <<~EOS
    Phux Cockpit provides native terminal tabs, split panes, and a focused
    system-WebKit surface. Terminal processes and layout are not restored
    when the app restarts.

    This release is ad-hoc signed and not Apple-notarized. The cask clears
    its quarantine attribute so macOS can launch it without a Developer ID
    certificate.
  EOS
end
