class MoshpitKeygenUnstable < Formula
  desc "Moshpit key tool (post-quantum/unstable build) — keygen, fingerprint, verify"
  homepage "https://github.com/rustyhorde/moshpit"
  license any_of: ["MIT", "Apache-2.0"]
  version "0.9.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/rustyhorde/moshpit/releases/download/v0.9.0/mp-keygen-unstable-aarch64-apple-darwin.tar.gz"
      sha256 "f466a6de5865fa25bfbed3b1425095468054fd611927e4641d304b05b85d9667"
    end
  end

  conflicts_with "moshpit-keygen", because: "both install the mp-keygen binary"

  def install
    bin.install "mp-keygen/mp-keygen"
    bash_completion.install "mp-keygen/mp-keygen.bash" => "mp-keygen"
    zsh_completion.install "mp-keygen/_mp-keygen"
    fish_completion.install "mp-keygen/mp-keygen.fish"
    man1.install "mp-keygen/mp-keygen.1"
  end

  test do
    system bin/"mp-keygen", "--version"
  end
end
