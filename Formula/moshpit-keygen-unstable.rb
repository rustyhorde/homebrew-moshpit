class MoshpitKeygenUnstable < Formula
  desc "Moshpit key tool (post-quantum/unstable build) — keygen, fingerprint, verify"
  homepage "https://github.com/rustyhorde/moshpit"
  license any_of: ["MIT", "Apache-2.0"]
  version "0.9.1"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/rustyhorde/moshpit/releases/download/v0.9.1/mp-keygen-unstable-aarch64-apple-darwin.tar.gz"
      sha256 "43f42a79499da70d68b252e39000531dee5556f03073b371b78a2eb8d7273043"
    end
  end

  conflicts_with "moshpit-keygen", because: "both install the mp-keygen binary"

  def install
    bin.install "mp-keygen"
    bash_completion.install "mp-keygen.bash" => "mp-keygen"
    zsh_completion.install "_mp-keygen"
    fish_completion.install "mp-keygen.fish"
    man1.install "mp-keygen.1"
  end

  test do
    system bin/"mp-keygen", "--version"
  end
end
