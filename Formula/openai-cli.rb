class OpenaiCli < Formula
  desc "AI-powered document analysis with 85+ expert consultation roles"
  homepage "https://github.com/marcelrgberger/openai-cli"
  url "https://github.com/marcelrgberger/openai-cli/archive/refs/tags/v0.2.0.tar.gz"
  sha256 "33385b6137ff9a35f909fb4afb57b2be2b636069f6c1894ef866179e981e3633"
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
