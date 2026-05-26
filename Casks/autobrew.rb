cask "autobrew" do
  version "2.5.1"
  sha256 "0f2b71ef45f78d7158aff30fac08cf05f244fe08fe5f6f8e924d42da48917f76"

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
