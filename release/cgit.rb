# typed: false
# frozen_string_literal: true

# This file was generated by GoReleaser. DO NOT EDIT.
class Cgit < Formula
  desc "cgit is a tiny tool for Chinese developers."
  homepage "https://github.com/linuxsuren/cgit"
  version "v0.0.9-next-df67465"
  bottle :unneeded

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/LinuxSuRen/cgit/releases/download/v0.0.9/cgit-darwin-amd64.tar.gz"
      sha256 "e962e5d22636b5caa8b089e7532228e82d4ab1262e8c93f87aa7054b7557568e"
    end
    if Hardware::CPU.arm?
      url "https://github.com/LinuxSuRen/cgit/releases/download/v0.0.9/cgit-darwin-arm64.tar.gz"
      sha256 "94f973d2df36ca1776f17eb25f34b2894e1ce81b2988806dfa8664a106d2fd29"
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url "https://github.com/LinuxSuRen/cgit/releases/download/v0.0.9/cgit-linux-amd64.tar.gz"
      sha256 "7aaa6bb4492ce04a2d8d5d9d508b6c22daae9dc32a15449415105f3d1718813d"
    end
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/LinuxSuRen/cgit/releases/download/v0.0.9/cgit-linux-arm64.tar.gz"
      sha256 "ca6cd3c14870ca96dfc244a8b471026520028c9c4c0a45547b04b228318680fe"
    end
  end

  depends_on "vim" => :optional
  depends_on "bash-completion" => :optional

  def install
    bin.install name

    prefix.install_metafiles
  end

  test do
    version_output = shell_output("#{bin}/cgit version")
    assert_match version.to_s, version_output
  end
end
