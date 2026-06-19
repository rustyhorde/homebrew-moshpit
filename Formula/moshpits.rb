class Moshpits < Formula
  desc "Moshpit server — mosh-like encrypted remote terminal host"
  homepage "https://github.com/rustyhorde/moshpit"
  license any_of: ["MIT", "Apache-2.0"]
  version "0.9.2"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/rustyhorde/moshpit/releases/download/v0.9.2/mps-aarch64-apple-darwin.tar.gz"
      sha256 "e849527f0dcdacef26cae88565db55b3e4868b0c41272ab749d2b57d367bef14"
    end
  end

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
