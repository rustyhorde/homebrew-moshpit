class MoshpitKeygen < Formula
  desc "Moshpit key generation, fingerprinting, and verification tool"
  homepage "https://github.com/rustyhorde/moshpit"
  license any_of: ["MIT", "Apache-2.0"]
  version "0.9.2"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/rustyhorde/moshpit/releases/download/v0.9.2/mp-keygen-aarch64-apple-darwin.tar.gz"
      sha256 "93cc58739b17eb249ea7959142550a05aa3d6f9b3ed8dcde02edf3e538ef6130"
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
