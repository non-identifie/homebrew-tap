class Uniji < Formula
  desc "Daemon and terminal clients driving ACP agents"
  homepage "https://github.com/non-identifie/homebrew-tap"
  version "0.1.1"
  license any_of: ["MIT", "Apache-2.0"]

  on_macos do
    depends_on arch: :arm64

    url "https://github.com/non-identifie/homebrew-tap/releases/download/v0.1.1/uniji-0.1.1-aarch64-apple-darwin.tar.gz"
    sha256 "979ebc5c84fa281264abb2af384d080f84032d9a8ea79c77014ad01495940ee9"
  end

  on_linux do
    on_arm do
      url "https://github.com/non-identifie/homebrew-tap/releases/download/v0.1.1/uniji-0.1.1-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "2396a699fbee3e223f1e91ece3d60978c9bf71dc96b0d33d88af2e5c78838bd6"
    end
    on_intel do
      url "https://github.com/non-identifie/homebrew-tap/releases/download/v0.1.1/uniji-0.1.1-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "aab85a253b89f6aa652e80ba19e6550ce3d7840a5559cb8947ed95680f453e6a"
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
