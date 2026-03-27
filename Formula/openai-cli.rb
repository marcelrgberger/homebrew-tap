class OpenaiCli < Formula
  desc "AI-powered document analysis with 85+ expert consultation roles"
  homepage "https://github.com/marcelrgberger/openai-cli"
  url "https://github.com/marcelrgberger/openai-cli/archive/refs/tags/v0.1.0.tar.gz"
  sha256 "9cd4ede6996aaa47c62cc4a5b4931df8faf0b8bc9e5f787b326607efa626cead"
  license "MIT"

  depends_on "node@22"

  def install
    system "npm", "install"
    system "npm", "run", "build"

    # Install the built dist + roles + node_modules into libexec
    libexec.install "dist", "node_modules", "package.json"
    libexec.install "src/roles" => "roles"

    # Create wrapper script in bin
    (bin/"openai-cli").write <<~SH
      #!/bin/bash
      exec "#{Formula["node@22"].opt_bin}/node" "#{libexec}/dist/bin/openai-cli.js" "$@"
    SH
  end

  def caveats
    <<~EOS
      Start openai-cli with:
        openai-cli

      On first launch, you'll be guided through setup:
      - Enter your OpenAI API key
      - Choose your preferred model

      No manual configuration needed!

      Documentation: https://github.com/marcelrgberger/openai-cli
    EOS
  end

  test do
    assert_match "openai-cli", shell_output("#{bin}/openai-cli --help")
  end
end
