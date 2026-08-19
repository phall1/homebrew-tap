class Phig < Formula
  desc "A fast, focused terminal Git history and diff browser"
  homepage "https://github.com/phall1/phig"
  version "1.0.0"
  if OS.mac?
    if Hardware::CPU.arm?
      url "https://github.com/phall1/phig/releases/download/v1.0.0/phig-cli-aarch64-apple-darwin.tar.xz"
      sha256 "575f26e8651cbc4c890df84567032108cbe6e11bdc29f3084a269d841519a63c"
    end
    if Hardware::CPU.intel?
      url "https://github.com/phall1/phig/releases/download/v1.0.0/phig-cli-x86_64-apple-darwin.tar.xz"
      sha256 "9f9a1f1f03e88b8e51efb7cfdccd4718bed18ae9a4c5c946e064c877b5d354bb"
    end
  end
  if OS.linux?
    if Hardware::CPU.arm?
      url "https://github.com/phall1/phig/releases/download/v1.0.0/phig-cli-aarch64-unknown-linux-gnu.tar.xz"
      sha256 "8987d36372d7d7f4e2f3d1f97f9a4592a01c71fa8869a22cbd54adb70fd49bc5"
    end
    if Hardware::CPU.intel?
      url "https://github.com/phall1/phig/releases/download/v1.0.0/phig-cli-x86_64-unknown-linux-gnu.tar.xz"
      sha256 "46118467b640136985bda1d6b54900e8c2e1517fe89350fe8632cc6f5434c16b"
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
