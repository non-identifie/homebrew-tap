class Uniji < Formula
  desc "Daemon and terminal clients driving ACP agents"
  homepage "https://github.com/non-identifie/homebrew-tap"
  version "0.1.2"
  license any_of: ["MIT", "Apache-2.0"]

  on_macos do
    depends_on arch: :arm64

    url "https://github.com/non-identifie/homebrew-tap/releases/download/v0.1.2/uniji-0.1.2-aarch64-apple-darwin.tar.gz"
    sha256 "7539722cc79a0ed96d209292344a9694ebf3142935b892ed3afc75f13d02e56a"
  end

  on_linux do
    on_arm do
      url "https://github.com/non-identifie/homebrew-tap/releases/download/v0.1.2/uniji-0.1.2-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "0b47cdb634bd3cd8c3a5046ce98ebcd340b5d5f748fd5996886d3e47a909b797"
    end
    on_intel do
      url "https://github.com/non-identifie/homebrew-tap/releases/download/v0.1.2/uniji-0.1.2-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "01c54a0b7de935894b070a75e7ba5aad3f297af0810f6f6c146633b157acc8a5"
    end
  end

  def install
    bin.install "uniji"
    bin.install "lifecycle/uniji-service"
  end

  service do
    run [opt_bin/"uniji", "daemon", "--listen", "127.0.0.1:8450"]
    keep_alive true
    stop_timeout 600
    working_dir Dir.home
    environment_variables PATH: "#{std_service_path_env}:#{Dir.home}/.local/bin:#{Dir.home}/.local/share/mise/shims"
    log_path var/"log/uniji.log"
    error_log_path var/"log/uniji.log"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/uniji --version")
  end
end
