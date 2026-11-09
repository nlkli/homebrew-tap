class Recol < Formula
  desc "CLI utility for switching color schemes"
  homepage "https://github.com/nlkli/recol"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/nlkli/recol/releases/download/v0.3.2/recol-macos-arm64.zip"
      sha256 "5abdc0556b7462e9b29e022271ea61c780d58c51e29ac4f835e416f8dbd91f3a"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/nlkli/recol/releases/download/v0.3.2/recol-linux-amd64.zip"
      sha256 "7febc7a3b12c924e1da90498994656122966c9de7c9b2447669aa9dcd1907ff0"
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
