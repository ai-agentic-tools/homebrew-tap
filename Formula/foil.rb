class Foil < Formula
  desc "Guardrails for AI coding agents: hidden secrets, network allowlist, audit log"
  homepage "https://ai-agentic-tools.github.io/Foil/"
  version "0.5.0"
  license "Apache-2.0"

  on_macos do
    url "https://github.com/ai-agentic-tools/Foil/releases/download/v0.5.0/foil-macos-universal"
    sha256 "003c3a86371ffc28e2c0c44ac428621e272b9f13a37e57b134a19897130489ad"
  end

  on_linux do
    on_intel do
      url "https://github.com/ai-agentic-tools/Foil/releases/download/v0.5.0/foil-x86_64-linux"
      sha256 "4404e0acc69acd0f6d999fcb9611420ae3e598ec8df0359a02b7847fa7a7531d"
    end
  end

  def install
    bin.install Dir["foil-*"].first => "foil"
  end

  def caveats
    on_linux do
      <<~EOS
        On Ubuntu 23.10 and later, approve foil to create user namespaces:
          sudo #{opt_bin}/foil setup
        and again after each brew upgrade (the approval names the binary's path).
      EOS
    end
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/foil --version")
  end
end
