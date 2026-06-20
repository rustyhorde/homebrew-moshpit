class MoshpitKeygen < Formula
  desc "Moshpit key generation, fingerprinting, and verification tool"
  homepage "https://github.com/rustyhorde/moshpit"
  license any_of: ["MIT", "Apache-2.0"]
  version "0.9.3"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/rustyhorde/moshpit/releases/download/v0.9.3/mp-keygen-aarch64-apple-darwin.tar.gz"
      sha256 "0bbc9cbe0138625bd1b6c80a4a7688ff946d6b7c3669bb5e8a0a83ccc4631475"
    end
  end

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
