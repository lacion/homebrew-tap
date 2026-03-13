class Superghost < Formula
  desc "Plain English test cases with AI execution and instant cached replay"
  homepage "https://github.com/lacion/superghost"
  version "0.4.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/lacion/superghost/releases/download/v#{version}/superghost-darwin-arm64"
      sha256 "5dc9e28bbe9e40ebd92cd76083790e51540bfc6feab99b55324d2e6f26d7ba2b"
    else
      url "https://github.com/lacion/superghost/releases/download/v#{version}/superghost-darwin-x64"
      sha256 "3143f2b6207cde848ff9abf7bc9e2b3fdb6427d35c366a6e4183b2b76ac5444d"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/lacion/superghost/releases/download/v#{version}/superghost-linux-arm64"
      sha256 "fec1c7986833bcf5b310a36d4c3bede5cff0c04d06692c2644cac846630f92e5"
    else
      url "https://github.com/lacion/superghost/releases/download/v#{version}/superghost-linux-x64"
      sha256 "522394401455559c7542282589ad569a70d3c931047f06b39c83be7317704f44"
    end
  end

  def install
    binary_name = stable.url.split("/").last
    bin.install binary_name => "superghost"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/superghost --version")
  end
end
