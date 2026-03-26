cask "autobrew" do
  version "1.0.2"
  sha256 "0c3c70bc8f9fdeb29948aad230186fde3f2398e712d584a0d918b828bd7fb12e"

  url "https://github.com/marcelrgberger/auto-brew/releases/download/v#{version}/AutoBrew.dmg"
  name "AutoBrew"
  desc "Automatically keeps Homebrew and all installed packages up to date"
  homepage "https://github.com/marcelrgberger/auto-brew"

  livecheck do
    url :url
    strategy :github_latest
  end

  app "AutoBrew.app"

  zap trash: [
    "~/Library/Preferences/za.co.digitalfreedom.AutoBrew.plist",
  ]
end

