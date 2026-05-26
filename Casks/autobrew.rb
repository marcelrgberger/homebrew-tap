cask "autobrew" do
  version "2.5.0"
  sha256 "22706b2e1e27d2b8ecc91b2805ecdd3f594514fcf056bf3a053babeaf8d17eca"

  url "https://github.com/marcelrgberger/auto-brew/releases/download/v#{version}/AutoBrew.dmg"
  name "AutoBrew"
  desc "Auto-update Homebrew + GUI store, snapshots, and cross-Mac restore"
  homepage "https://github.com/marcelrgberger/auto-brew"

  livecheck do
    url :url
    strategy :github_latest
  end

  depends_on macos: :sonoma

  app "AutoBrew.app"
  binary "#{appdir}/AutoBrew.app/Contents/Helpers/autobrew"

  zap trash: [
    "~/Library/Application Support/AutoBrew",
    "~/Library/Preferences/za.co.digitalfreedom.AutoBrew.plist",
  ]
end
