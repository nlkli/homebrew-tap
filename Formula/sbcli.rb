class Sbcli < Formula
  desc "CLI utility for proxy management"
  homepage "https://github.com/nlkli/sbcli"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/nlkli/sbcli/releases/download/v0.1.0/sbcli-macos-arm64.zip"
      sha256 "9d5430de332537892f2469c5f524ee4f9959f91459d0ea96b26f52178da61a06"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/nlkli/sbcli/releases/download/v0.1.0/sbcli-linux-amd64.zip"
      sha256 "f90cb80ac0ddb2a9becc9e0be90aebed7e6847b600d1343ba935750bf87af373"
    end
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/sbcli --version")
  end
end
