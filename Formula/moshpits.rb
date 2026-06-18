class Moshpits < Formula
  desc "Moshpit server — mosh-like encrypted remote terminal host"
  homepage "https://github.com/rustyhorde/moshpit"
  license any_of: ["MIT", "Apache-2.0"]
  version "0.9.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/rustyhorde/moshpit/releases/download/v0.9.0/mps-aarch64-apple-darwin.tar.gz"
      sha256 "0669c74f26fe7291e4e11332c91010813664fa685ee918014ddb20ecc0e0eb48"
    end
  end

  def install
    bin.install "mps/mps"
    bash_completion.install "mps/mps.bash" => "mps"
    zsh_completion.install "mps/_mps"
    fish_completion.install "mps/mps.fish"
    man1.install "mps/mps.1"
    (etc/"moshpits").install "mps/moshpits.toml.example" if File.exist?("mps/moshpits.toml.example")
  end

  def caveats
    <<~EOS
      mps requires a config file and a key pair before it can start, and listens
      for inbound UDP on ports 50000–59999 (open these on your firewall).

      Generate keys with mp-keygen:
        brew install rustyhorde/moshpit/moshpit-keygen

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
