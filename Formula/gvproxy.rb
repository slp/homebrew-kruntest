class Gvproxy < Formula
  desc "New network stack based on gVisor"
  homepage "https://github.com/containers/gvisor-tap-vsock"
  url "https://github.com/containers/gvisor-tap-vsock/archive/refs/tags/v0.8.8.tar.gz"
  sha256 "4f7c4885225d71b21f6b547b94d92fc6da4a4fef9d382fdd19c8ea67f67be839"
  license "Apache-2.0"

  bottle do
    root_url "https://github.com/slp/homebrew-kruntest/releases/download/gvproxy-0.8.8"
    sha256 cellar: :any_skip_relocation, arm64_tahoe:   "12e9c5f608185a587558097e39fb140a1ea478fb3bc25553b508c17b0fcacd01"
    sha256 cellar: :any_skip_relocation, arm64_sequoia: "52f51d164570d08d7ce16650da102009270913c28341e12b18a91d8d3efa1a44"
  end

  depends_on "go" => :build

  def install
    system "make"
    bin.install "bin/gvproxy" => "gvproxy"
  end

  test do
    assert_match "gvproxy version", shell_output("#{bin}/gvproxy -version")
  end
end
