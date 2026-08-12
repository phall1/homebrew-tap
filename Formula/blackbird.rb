# Generated from tools/blackbird.json. Do not edit by hand.
class Blackbird < Formula
  desc "Durable local-first coordination for human and AI agent work"
  homepage "https://github.com/phall1/blackbird"

  livecheck do
    url :stable
    strategy :github_latest
  end

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/phall1/blackbird/releases/download/v0.1.8/blackbird-v0.1.8-aarch64-apple-darwin.tar.gz"
      sha256 "ea40c104e5ac083e2aca0c2db4f4efa893f9f03c8e32b9385639f47c77478c68"
    else
      odie "Blackbird currently requires Apple Silicon on macOS"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/phall1/blackbird/releases/download/v0.1.8/blackbird-v0.1.8-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "15619c076effe6502e2ae2c0fe6e06a0aa99c5c5fed2010085104fdc5f830add"
    else
      url "https://github.com/phall1/blackbird/releases/download/v0.1.8/blackbird-v0.1.8-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "f30edcfdf2244a3a381ef32cb7da9fb1b365ffc233c303dfdee14c120685d154"
    end
  end

  def install
    bin.install "blackbird", "blackbird-claude"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/blackbird --version")
    assert_match version.to_s, shell_output("#{bin}/blackbird-claude --version")
  end
end
