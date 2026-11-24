class Sbcli < Formula
  desc "CLI utility for proxy management"
  homepage "https://github.com/nlkli/sbcli"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/nlkli/sbcli/releases/download/v0.1.1/sbcli-macos-arm64.zip"
      sha256 "313848cb6729e89c5e08432f08f5b34c506f76d1fb2f0d0490a024184abf899a"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/nlkli/sbcli/releases/download/v0.1.1/sbcli-linux-amd64.zip"
      sha256 "f703a990a15d5db74de0d1d403524d25f5d36df17486787f9dd833a586bb49fe"
    end
  end

  def install
    bin.install "sbcli"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/sbcli --version")
  end
end
