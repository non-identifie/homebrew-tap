class Uniji < Formula
  desc "Daemon and terminal clients driving ACP agents"
  homepage "https://github.com/non-identifie/homebrew-tap"
  version "0.1.3"
  license any_of: ["MIT", "Apache-2.0"]

  on_macos do
    depends_on arch: :arm64

    url "https://github.com/non-identifie/homebrew-tap/releases/download/v0.1.3/uniji-0.1.3-aarch64-apple-darwin.tar.gz"
    sha256 "a7fee4228edcda433f30a6921b5fcb4c2e9cbde2566cdb18c27cf5fdc0da63c2"
  end

  on_linux do
    on_arm do
      url "https://github.com/non-identifie/homebrew-tap/releases/download/v0.1.3/uniji-0.1.3-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "3fcf81402a48e1422dad09a4cc3f79c3a1e2d8c05919630aaae1712c234ffc86"
    end
    on_intel do
      url "https://github.com/non-identifie/homebrew-tap/releases/download/v0.1.3/uniji-0.1.3-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "4baea98098e5d7d089f5a90bfa2793f52664bb04f7883ecf190c39304b1a8741"
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
