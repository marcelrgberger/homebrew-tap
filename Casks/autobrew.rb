cask "autobrew" do
  version "2.1.0"
  sha256 "75c2daa5214ec7f0117d13ff85e456fcb02b6b937ececb0020315dfb14fee78d"

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

