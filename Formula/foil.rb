class Foil < Formula
  desc "Guardrails for AI coding agents: hidden secrets, network allowlist, audit log"
  homepage "https://ai-agentic-tools.github.io/Foil/"
  version "0.5.1"
  license "Apache-2.0"

  on_macos do
    url "https://github.com/ai-agentic-tools/Foil/releases/download/v0.5.1/foil-macos-universal"
    sha256 "9dfdb7301cd1e58ff5d7d1a2345e653600d1e37f7b4aa212c288d865de6f000e"
  end

  on_linux do
    on_intel do
      url "https://github.com/ai-agentic-tools/Foil/releases/download/v0.5.1/foil-x86_64-linux"
      sha256 "b7ad1953ef12c793bd040ae74e33645ef25015f369e1325992440553836d28b6"
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
