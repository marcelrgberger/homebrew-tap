class OpenaiCli < Formula
  desc "AI-powered document analysis with 85+ expert consultation roles"
  homepage "https://github.com/marcelrgberger/openai-cli"
  url "https://github.com/marcelrgberger/openai-cli/archive/refs/tags/v0.2.0.tar.gz"
  sha256 "e551f6bb948190a29c3297e5c8f06a5b443838411b7438c77c89014056832405"
  license "MIT"

  depends_on "node@22"

  def install
    system "npm", "install"
    system "npm", "run", "build"

    libexec.install "dist", "node_modules", "package.json"
    (libexec/"roles").install Dir["src/roles/**/*.md"]

    (bin/"openai-cli").write <<~SH
      #!/bin/bash
      exec "#{Formula["node@22"].opt_bin}/node" "#{libexec}/dist/openai-cli.js" "\$@"
    SH
  end

  def caveats
    <<~EOS
      Start openai-cli:
        openai-cli

      On first launch, the onboarding will guide you through:
        1. Entering your OpenAI API key
        2. Choosing your preferred model

      Documentation: https://github.com/marcelrgberger/openai-cli
    EOS
  end

  test do
    assert_match "openai-cli", shell_output("#{bin}/openai-cli --help")
  end
end
