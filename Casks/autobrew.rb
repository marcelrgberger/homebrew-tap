cask "autobrew" do
  version "1.0.3"
  sha256 "d51d22d97dd016d86f706dd979894946a0d2af433d7da76f66080fd0faa3a7cc"

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

