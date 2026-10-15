cask "autobrew" do
  version "2.5.3"
  sha256 "420a359416fc9da253633bd296660e0d64aa80ba803ee1f46d48c1bee5982246"

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

  # Explicit symlink path so brew can clean up on upgrade/reinstall even
  # when the source app has already been moved to the Caskroom backup
  # (otherwise brew fails with "symlink source ... is not there").
  uninstall delete: "#{HOMEBREW_PREFIX}/bin/autobrew"

  zap trash: [
    "~/Library/Application Support/AutoBrew",
    "~/Library/Preferences/za.co.digitalfreedom.AutoBrew.plist",
  ]
end
