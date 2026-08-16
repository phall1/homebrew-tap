# Generated from tools/phux-cockpit.json. Do not edit by hand.
cask "phux-cockpit" do
  version "0.11.0"
  sha256 "a12d6c0fb3c920d0863f23458e6b6f4cf8d16c768929639ea12f6525a196bd3e"

  url "https://github.com/phall1/phux-cockpit/releases/download/v#{version}/phux-cockpit-#{version}-macos-arm64.zip",
      verified: "github.com/phall1/phux-cockpit/"
  name "Phux Cockpit"
  desc "Native spatial runtime for terminal and web surfaces"
  homepage "https://github.com/phall1/phux-cockpit"

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
