class Recol < Formula
  desc "CLI utility for switching color schemes"
  homepage "https://github.com/nlkli/recol"
  url "https://github.com/nlkli/recol/archive/refs/tags/v0.2.4.tar.gz"
  sha256 "ac23156089bd1fdd1822823ab41e5ac7d0b7b5f41c4aff84eb8cddad33128f6b"
  license "MIT"

  depends_on "rust" => :build

  def install
    system "cargo", "install", *std_cargo_args
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/recol --version")
  end
end
