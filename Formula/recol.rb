class Recol < Formula
  desc "CLI utility for switching color schemes"
  homepage "https://github.com/nlkli/recol"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/nlkli/recol/releases/download/v0.3.2/recol-macos-arm64.zip"
      sha256 "a5f096d37f40a66a76daf399d1fdea1e6d82625fba093494efa5303229501f01"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/nlkli/recol/releases/download/v0.3.2/recol-linux-amd64.zip"
      sha256 "0aeb9d4c1659a73618f9dd6cc4f7bcc4a025a17a85c42a998dc8c4da98509cec"
    end
  end

  def install
    bin.install "recol"

    (bash_completion/"recol").write Utils.safe_popen_read(bin/"recol", "--completions")

    (zsh_completion/"_recol").write <<~'EOS'
      #compdef recol
      local -a r
      r=("${(@f)$(recol --complete $((CURRENT-1)) "${words[@]}" 2>/dev/null)}")
      [[ -n $r ]] && compadd -U -- $r || _files
    EOS
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/recol --version")
  end
end
