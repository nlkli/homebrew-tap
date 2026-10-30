class Recol < Formula
  desc "CLI utility for switching color schemes"
  homepage "https://github.com/nlkli/recol"
  license "MIT"

  depends_on arch: :arm64

  url "https://github.com/nlkli/recol/releases/download/v0.3.0/recol-macos-arm64.zip"
  sha256 "473c4641354d040f5ae49a42a3bdb04df80c760265634075e43b402c1312d7e1"

  def install
    bin.install "recol"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/recol --version")
  end
end
