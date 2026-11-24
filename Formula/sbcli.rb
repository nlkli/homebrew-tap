class Sbcli < Formula
  desc "CLI utility for proxy management"
  homepage "https://github.com/nlkli/sbcli"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/nlkli/sbcli/releases/download/v0.1.1/sbcli-macos-arm64.zip"
      sha256 "d64c1acbad96075a0a7e92abb1c5c09549cac35452f35d73319250a9856209d9"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/nlkli/sbcli/releases/download/v0.1.1/sbcli-linux-amd64.zip"
      sha256 "5babf3c54b0a1184bdaf89234102c7f0f4379de37a26305576da3a0a4f6db66d"
    end
  end

  def install
    bin.install "sbcli"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/sbcli --version")
  end
end
