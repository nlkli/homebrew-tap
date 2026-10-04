class Recol < Formula
  desc "CLI utility for switching color schemes"
  homepage "https://github.com/nlkli/recol"
  license "MIT"

  depends_on arch: :arm64

  url "https://github.com/nlkli/recol/releases/download/v0.2.8/recol-macos-arm64.zip"
  sha256 "8fc6ce28c1e0f636ba3cf41adfa49eb06cb57c2c8aa87785a3917cad23924767"

  def install
    bin.install "recol"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/recol --version")
  end
end
