class MoshpitsUnstable < Formula
  desc "Moshpit server (post-quantum/unstable build) — encrypted remote terminal host"
  homepage "https://github.com/rustyhorde/moshpit"
  license any_of: ["MIT", "Apache-2.0"]
  version "0.9.2"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/rustyhorde/moshpit/releases/download/v0.9.2/mps-unstable-aarch64-apple-darwin.tar.gz"
      sha256 "b375169e0aa19714887437b7c7610e5ee5e48d738bea358add7ab67c54072690"
    end
  end

  conflicts_with "moshpits", because: "both install the mps binary"

  def install
    bin.install "mps"
    bash_completion.install "mps.bash" => "mps"
    zsh_completion.install "_mps"
    fish_completion.install "mps.fish"
    man1.install "mps.1"
    (etc/"moshpits").install "moshpits.toml.example" if File.exist?("moshpits.toml.example")
  end

  def caveats
    <<~EOS
      mps requires a config file and a key pair before it can start, and listens
      for inbound UDP on ports 50000–59999 (open these on your firewall).

      Generate keys with mp-keygen:
        brew install rustyhorde/moshpit/moshpit-keygen-unstable

      Copy the example config to get started:
        mkdir -p "$HOME/Library/Application Support/moshpits"
        cp #{etc}/moshpits/moshpits.toml.example \\
          "$HOME/Library/Application Support/moshpits/moshpits.toml"
    EOS
  end

  test do
    system bin/"mps", "--version"
  end
end
