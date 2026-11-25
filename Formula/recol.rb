class Recol < Formula
  desc "CLI utility for switching color schemes"
  homepage "https://github.com/nlkli/recol"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/nlkli/recol/releases/download/v0.3.2/recol-macos-arm64.zip"
      sha256 "a2f4e816602e086940b7fb22e81aae6ffa41fd2cfe2ec0af9839c072a8698b4a"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/nlkli/recol/releases/download/v0.3.2/recol-linux-amd64.zip"
      sha256 "d72a9a2e390114e55d500362015499846b3af5bd1ae0cb1db9ea0f3846123102"
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
