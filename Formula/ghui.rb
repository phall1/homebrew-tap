class Ghui < Formula
  desc "Terminal UI for GitHub pull requests, issues, diffs, and Actions"
  homepage "https://github.com/phall1/ghui"
  version "0.10.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/phall1/ghui/releases/download/v0.10.0/ghui-darwin-arm64.tar.gz"
      sha256 "fcec7de1c1d273125607bcad351e80f619f3ea1067d92d4e08183c5ed55c8762"
    else
      url "https://github.com/phall1/ghui/releases/download/v0.10.0/ghui-darwin-x64.tar.gz"
      sha256 "8e7a8a470efe9e54d5be3fff877c98864da8e82c68d4ecbc369dc0a0a28abe29"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/phall1/ghui/releases/download/v0.10.0/ghui-linux-arm64.tar.gz"
      sha256 "25c47cf9b9979ab2bfd5a0743cf236af47818e89b25df7e6656d11711884b6a0"
    else
      url "https://github.com/phall1/ghui/releases/download/v0.10.0/ghui-linux-x64.tar.gz"
      sha256 "783718f06e153111f093078afe986afc89f483fc868a038ef2ac42478d661482"
    end
  end

  def install
    bin.install "ghui"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/ghui --version")
  end
end
