cask "autobrew" do
  version "2.0.0"
  sha256 "1007657572ca3f39735686b6de105b5c6bf6ae24ab0d4abf8371190974ceabaf"

  url "https://github.com/marcelrgberger/auto-brew/releases/download/v#{version}/AutoBrew.dmg"
  name "AutoBrew"
  desc "Auto-update Homebrew + GUI store, snapshots, and cross-Mac restore"
  homepage "https://github.com/marcelrgberger/auto-brew"

  livecheck do
    url :url
    strategy :github_latest
  end

  depends_on macos: ">= :tahoe"

  app "AutoBrew.app"

  zap trash: [
    "~/Library/Preferences/za.co.digitalfreedom.AutoBrew.plist",
    "~/Library/Application Support/AutoBrew",
  ]
end

