class Moshpit < Formula
  desc "Moshpit client — mosh-like encrypted remote terminal"
  homepage "https://github.com/rustyhorde/moshpit"
  license any_of: ["MIT", "Apache-2.0"]
  version "0.9.2"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/rustyhorde/moshpit/releases/download/v0.9.2/mp-aarch64-apple-darwin.tar.gz"
      sha256 "5e6a6af1d2ee390390986204b18c6c2d71dd271777e4221f513ed96787589f32"
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
