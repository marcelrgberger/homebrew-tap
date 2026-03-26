cask "autobrew" do
  version "1.0.0"
  sha256 :no_check

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
