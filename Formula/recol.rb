class Recol < Formula
  desc "CLI utility for switching color schemes"
  homepage "https://github.com/nlkli/recol"
  license "MIT"

  depends_on arch: :arm64

  url "https://github.com/nlkli/recol/releases/download/v0.2.5/recol-macos-arm64.zip"
  sha256 "b42e2d541c395ecf03cd9be2ef609237d229d14c4f44cc594beee49a38f97517"

  def install
    bin.install "recol"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/recol --version")
  end
end
