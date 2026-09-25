class Recol < Formula
  desc "CLI utility for switching color schemes"
  homepage "https://github.com/nlkli/recol"
  license "MIT"

  depends_on arch: :arm64

  url "https://github.com/nlkli/recol/releases/download/v0.2.6/recol-macos-arm64.zip"
  sha256 "0f4c2d8713cb0ea82ebf63d8cd6bbfdcb3c34cdc75d842a82b5177fdbc6161db"

  def install
    bin.install "recol"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/recol --version")
  end
end
