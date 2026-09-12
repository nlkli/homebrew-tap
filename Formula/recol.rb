class Recol < Formula
  desc "CLI utility for switching color schemes"
  homepage "https://github.com/nlkli/recol"
  license "MIT"

  depends_on arch: :arm64

  url "https://github.com/nlkli/recol/releases/download/v0.2.4/recol-macos-arm64.zip"
  sha256 "b2460288780cd0fda77fc1a4a6b3b358a1bf2ba95d8968df747e82a1912b1d8c"

  def install
    bin.install "recol"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/recol --version")
  end
end
