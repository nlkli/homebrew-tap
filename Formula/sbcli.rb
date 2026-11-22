class Sbcli < Formula
  desc "CLI utility for proxy management"
  homepage "https://github.com/nlkli/sbcli"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/nlkli/sbcli/releases/download/v0.1.1/sbcli-macos-arm64.zip"
      sha256 "eb0538c0473a60be1b9243a1462becf26de06678e9c8078837c6b9209b8c29c6"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/nlkli/sbcli/releases/download/v0.1.1/sbcli-linux-amd64.zip"
      sha256 "f519a28fc075d39c05d80a7835133fe0fa742e84d21df0b2a3f319cdbe6e3ab7"
    end
  end

  def install
    bin.install "sbcli"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/sbcli --version")
  end
end
