class Phig < Formula
  desc "A fast, focused terminal Git history and diff browser"
  homepage "https://github.com/phall1/phig"
  version "1.1.0"
  if OS.mac?
    if Hardware::CPU.arm?
      url "https://github.com/phall1/phig/releases/download/v1.1.0/phig-cli-aarch64-apple-darwin.tar.xz"
      sha256 "dee0c450cd64ede5630c93dfc262e3e04001f359e4e9fdedf2545f9895d96737"
    end
    if Hardware::CPU.intel?
      url "https://github.com/phall1/phig/releases/download/v1.1.0/phig-cli-x86_64-apple-darwin.tar.xz"
      sha256 "a08fcff964d7a0ade8759ba483a97908c4d0272271332a6746c1a3888bf331c9"
    end
  end
  if OS.linux?
    if Hardware::CPU.arm?
      url "https://github.com/phall1/phig/releases/download/v1.1.0/phig-cli-aarch64-unknown-linux-gnu.tar.xz"
      sha256 "d2bdef14d145e31853177ebc915cff273bd62036b07d724f4d66a3fc2229721e"
    end
    if Hardware::CPU.intel?
      url "https://github.com/phall1/phig/releases/download/v1.1.0/phig-cli-x86_64-unknown-linux-gnu.tar.xz"
      sha256 "7151468ac482cb53dbb6111d2ee2bee17834d83c8d3cbec7f77380e4decf04a8"
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
