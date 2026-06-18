class Moshpit < Formula
  desc "Moshpit client — mosh-like encrypted remote terminal"
  homepage "https://github.com/rustyhorde/moshpit"
  license any_of: ["MIT", "Apache-2.0"]
  version "0.9.1"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/rustyhorde/moshpit/releases/download/v0.9.1/mp-aarch64-apple-darwin.tar.gz"
      sha256 "fe7ebaba347d251db689e67dde83fd812addeefb9c9bf809857d35af372aee3e"
    end
  end

  def install
    bin.install "mp"
    bash_completion.install "mp.bash" => "mp"
    zsh_completion.install "_mp"
    fish_completion.install "mp.fish"
    man1.install "mp.1"
    (etc/"moshpit").install "moshpit.toml.example" if File.exist?("moshpit.toml.example")
  end

  def caveats
    <<~EOS
      Generate or verify keys with mp-keygen:
        brew install rustyhorde/moshpit/moshpit-keygen

      Copy the example config to get started:
        mkdir -p "$HOME/Library/Application Support/moshpit"
        cp #{etc}/moshpit/moshpit.toml.example \\
          "$HOME/Library/Application Support/moshpit/moshpit.toml"
    EOS
  end

  test do
    system bin/"mp", "--version"
  end
end
