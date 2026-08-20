class Phig < Formula
  desc "A fast, focused terminal Git history and diff browser"
  homepage "https://github.com/phall1/phig"
  version "1.1.1"
  if OS.mac?
    if Hardware::CPU.arm?
      url "https://github.com/phall1/phig/releases/download/v1.1.1/phig-cli-aarch64-apple-darwin.tar.xz"
      sha256 "4001b319208fd1e6f02a7a886759bc02bc668bee9b80a47eaca28b373882356d"
    end
    if Hardware::CPU.intel?
      url "https://github.com/phall1/phig/releases/download/v1.1.1/phig-cli-x86_64-apple-darwin.tar.xz"
      sha256 "6db2e196f4a9ed0ec62805610fd3676daf0096202a14a9e6255f07e79531f8f4"
    end
  end
  if OS.linux?
    if Hardware::CPU.arm?
      url "https://github.com/phall1/phig/releases/download/v1.1.1/phig-cli-aarch64-unknown-linux-gnu.tar.xz"
      sha256 "a25c9266ba07ab981a5f0ce669686eed60326e314cc5e58de1f5d2b6f5758347"
    end
    if Hardware::CPU.intel?
      url "https://github.com/phall1/phig/releases/download/v1.1.1/phig-cli-x86_64-unknown-linux-gnu.tar.xz"
      sha256 "c2cf4f2a7d96f922cc75052817165a48d4db60ea8d73440c63ea424dd9446af7"
    end
  end
  license any_of: ["MIT", "Apache-2.0"]

  BINARY_ALIASES = {
    "aarch64-apple-darwin":      {},
    "aarch64-unknown-linux-gnu": {},
    "x86_64-apple-darwin":       {},
    "x86_64-unknown-linux-gnu":  {},
  }.freeze

  def target_triple
    cpu = Hardware::CPU.arm? ? "aarch64" : "x86_64"
    os = OS.mac? ? "apple-darwin" : "unknown-linux-gnu"

    "#{cpu}-#{os}"
  end

  def install_binary_aliases!
    BINARY_ALIASES[target_triple.to_sym].each do |source, dests|
      dests.each do |dest|
        bin.install_symlink bin/source.to_s => dest
      end
    end
  end

  def install
    if OS.mac? && Hardware::CPU.arm?
      bin.install "phig"
    end
    if OS.mac? && Hardware::CPU.intel?
      bin.install "phig"
    end
    if OS.linux? && Hardware::CPU.arm?
      bin.install "phig"
    end
    if OS.linux? && Hardware::CPU.intel?
      bin.install "phig"
    end

    install_binary_aliases!

    # Homebrew will automatically install these, so we don't need to do that
    doc_files = Dir["README.*", "readme.*", "LICENSE", "LICENSE.*", "CHANGELOG.*"]
    leftover_contents = Dir["*"] - doc_files

    # Install any leftover files in pkgshare; these are probably config or
    # sample files.
    pkgshare.install(*leftover_contents) unless leftover_contents.empty?
  end
end
