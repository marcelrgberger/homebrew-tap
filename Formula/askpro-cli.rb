class AskproCli < Formula
  desc "AI-powered document analysis with 85+ expert consultation roles — Ask a Pro"
  homepage "https://github.com/marcelrgberger/askpro-cli"
  url "https://github.com/marcelrgberger/askpro-cli/archive/refs/tags/v0.2.0.tar.gz"
  sha256 "f688ab9ffa188e4ac348daf00c9827e6849b780acb1224b01662196ef13296f8"
  license "MIT"

  depends_on "node@22"

  def install
    system "npm", "install"
    system "npm", "run", "build"

    libexec.install "dist", "node_modules", "package.json"
    (libexec/"roles").install Dir["src/roles/**/*.md"]

    (bin/"askpro").write <<~SH
      #!/bin/bash
      exec "#{Formula["node@22"].opt_bin}/node" "#{libexec}/dist/askpro-cli.js" "\$@"
    SH
  end

  def caveats
    <<~EOS
      Start askpro:
        askpro

      On first launch, the onboarding will guide you through:
        1. Entering your OpenAI API key
        2. Choosing your preferred model

      Documentation: https://github.com/marcelrgberger/askpro-cli
    EOS
  end

  test do
    assert_match "askpro", shell_output("#{bin}/askpro --help")
  end
end
