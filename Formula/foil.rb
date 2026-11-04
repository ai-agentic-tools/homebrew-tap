class Foil < Formula
  desc "Local sandbox for AI coding agents: instant copy-on-write branches of your repo"
  homepage "https://ai-agentic-tools.github.io/Foil/"
  version "0.4.0"
  license "Apache-2.0"

  on_macos do
    url "https://github.com/ai-agentic-tools/Foil/releases/download/v0.4.0/foil-macos-universal"
    sha256 "30d36a29e36db67ce60a2102419f378329368ebf51baddd7233b596174fdf94f"
  end

  on_linux do
    on_intel do
      url "https://github.com/ai-agentic-tools/Foil/releases/download/v0.4.0/foil-x86_64-linux"
      sha256 "e845916396b3c9f47e021faff2e3216a98834dffcffd00507797b3aea67ec552"
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
