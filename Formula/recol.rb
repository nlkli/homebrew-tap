class Recol < Formula
  desc "CLI utility for switching color schemes"
  homepage "https://github.com/nlkli/recol"
  license "MIT"

  depends_on arch: :arm64

  url "https://github.com/nlkli/recol/releases/download/v0.3.0/recol-macos-arm64.zip"
  sha256 "2aa1c4c0541caa4139837b70a5fdae13f893b7259c7ccd3543f1fe233f94255a"

  def install
    bin.install "recol"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/recol --version")
  end
end
