class OpenaiCli < Formula
  desc "AI-powered document analysis with 85+ expert consultation roles"
  homepage "https://github.com/marcelrgberger/openai-cli"
  url "https://github.com/marcelrgberger/openai-cli/archive/refs/tags/v0.1.0.tar.gz"
  sha256 "9cd4ede6996aaa47c62cc4a5b4931df8faf0b8bc9e5f787b326607efa626cead"
  license "MIT"

  depends_on "node@22"

  def install
    system "npm", "install", *std_npm_args
    bin.install_symlink Dir["#{libexec}/bin/*"]
  end

  def caveats
    <<~EOS
      To use openai-cli, you need an OpenAI API key:
        export OPENAI_API_KEY="sk-..."

      Then start with:
        openai-cli

      Documentation: https://github.com/marcelrgberger/openai-cli
    EOS
  end

  test do
    assert_match "openai-cli", shell_output("#{bin}/openai-cli --help")
  end
end
