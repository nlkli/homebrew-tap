class Recol < Formula
  desc "CLI utility for switching color schemes"
  homepage "https://github.com/nlkli/recol"
  license "MIT"

  depends_on arch: :arm64

  url "https://github.com/nlkli/recol/releases/download/v0.3.1/recol-macos-arm64.zip"
  sha256 "51537b7bc9e3d04f0aae2d888b060dbd599c19f2dbd29e4e5532628bd05a3742"

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
