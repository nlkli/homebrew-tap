class Recol < Formula
  desc "CLI utility for switching color schemes"
  homepage "https://github.com/nlkli/recol"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/nlkli/recol/releases/download/v0.3.3/recol-macos-arm64.zip"
      sha256 "ed1cd4d119aefc7f3281cf27518fcfd579a5c8657e3fe727aac5ede4581e05f9"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/nlkli/recol/releases/download/v0.3.3/recol-linux-amd64.zip"
      sha256 "c3e54dd47c8bcffa0f655708bf8f3b534a86cf44197e62fe1be99f9d4f6f8036"
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
