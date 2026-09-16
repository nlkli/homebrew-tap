class Recol < Formula
  desc "CLI utility for switching color schemes"
  homepage "https://github.com/nlkli/recol"
  license "MIT"

  depends_on arch: :arm64

  url "https://github.com/nlkli/recol/releases/download/v0.2.5/recol-macos-arm64.zip"
  sha256 "ad2388db1524671624ca53d44aa5b02d7a8cd2c209fcebd2b369022fa757523e"

  def install
    bin.install "recol"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/recol --version")
  end
end
