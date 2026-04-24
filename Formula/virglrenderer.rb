class Virglrenderer < Formula
  desc "VirGL virtual OpenGL renderer"
  homepage "https://gitlab.freedesktop.org/virgl/virglrenderer"
  url "https://gitlab.freedesktop.org/slp/virglrenderer/-/archive/0.10.4e-krunkit/virglrenderer-0.10.4e-krunkit.tar.gz"
  sha256 "09d000623fbdb966cb604eb48c962a0815e8142383e6066d6494809335b76dbb"
  license "MIT"

  bottle do
    root_url "https://github.com/slp/homebrew-kruntest/releases/download/virglrenderer-0.10.4e"
    sha256 cellar: :any, arm64_tahoe:   "ecdc8d274322faa58a6e539886c0414c4cc092c3c9d55f8320646444a7fd3adb"
    sha256 cellar: :any, arm64_sequoia: "88e58017405983c9b470ba1b231fc8ad247837d3de7189af4a5850596c4140e6"
  end

  depends_on "meson" => :build
  depends_on "ninja" => :build
  depends_on "pkg-config" => :build
  depends_on "libepoxy"
  depends_on "molten-vk"

  def install
    args = %w[
      -Dvenus=true
      -Drender-server=false
    ]

    system "meson", "setup", "build", *args, *std_meson_args
    system "meson", "compile", "-C", "build", "--verbose"
    system "meson", "install", "-C", "build"
  end
end
