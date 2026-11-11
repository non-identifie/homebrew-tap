class Uniji < Formula
  desc "Daemon and terminal clients driving ACP agents"
  homepage "https://github.com/non-identifie/homebrew-tap"
  version "0.1.0"
  license any_of: ["MIT", "Apache-2.0"]

  on_macos do
    depends_on arch: :arm64

    url "https://github.com/non-identifie/homebrew-tap/releases/download/v0.1.0/uniji-0.1.0-aarch64-apple-darwin.tar.gz"
    sha256 "570226d0cb1c57ca395865074c4e814fbc50c35ef38a2e4afec8dc13d248626e"
  end

  on_linux do
    on_arm do
      url "https://github.com/non-identifie/homebrew-tap/releases/download/v0.1.0/uniji-0.1.0-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "79505c90094357ec94ad64d38226f96f7f584d7534956a1057078ed456850775"
    end
    on_intel do
      url "https://github.com/non-identifie/homebrew-tap/releases/download/v0.1.0/uniji-0.1.0-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "f0122243d772237475edb1e74b02d8105862c37d6c444b71e45beb23bfbe04a6"
    end
  end

  def install
    bin.install "uniji"
    bin.install "lifecycle/uniji-service"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/uniji --version")
  end
end
