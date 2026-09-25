class Recol < Formula
  desc "CLI utility for switching color schemes"
  homepage "https://github.com/nlkli/recol"
  license "MIT"

  depends_on arch: :arm64

  url "https://github.com/nlkli/recol/releases/download/v0.2.6/recol-macos-arm64.zip"
  sha256 "c3c1e7711a383e3d1a7ba3bcd428ca54d7cc93da2473ebaa05776897173469c2"

  def install
    bin.install "recol"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/recol --version")
  end
end
