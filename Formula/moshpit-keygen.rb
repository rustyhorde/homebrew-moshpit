class MoshpitKeygen < Formula
  desc "Moshpit key generation, fingerprinting, and verification tool"
  homepage "https://github.com/rustyhorde/moshpit"
  license any_of: ["MIT", "Apache-2.0"]
  version "0.9.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/rustyhorde/moshpit/releases/download/v0.9.0/mp-keygen-aarch64-apple-darwin.tar.gz"
      sha256 "4765aa47a74acf07e364b25d0e4c355bdba80ef674a4441fdd0377c934300186"
    end
  end

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
