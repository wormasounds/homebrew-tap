cask "wormasounds" do
  version "0.1.2"
  sha256 "c2b088cf9fa33fa24eadd2e4d17c2bc64a8e6fb2719f0d852987fb8164a7aa62"

  url "https://github.com/wormasounds/WormaSounds-releases/releases/download/v#{version}/WormaSounds-#{version}.dmg",
      verified: "github.com/wormasounds/WormaSounds-releases/"
  name "WormaSounds"
  desc "Per-app volume, outputs and effects from the menu bar"
  homepage "https://sounds.worma.dev/"

  livecheck do
    url "https://github.com/wormasounds/WormaSounds-releases/releases/latest/download/appcast.xml"
    strategy :sparkle, &:short_version
  end

  auto_updates true
  depends_on macos: ">= :tahoe"

  app "WormaSounds.app"

  uninstall quit: "com.wormadev.WormaSounds"

  zap trash: [
    "~/Library/Caches/com.wormadev.WormaSounds",
    "~/Library/HTTPStorages/com.wormadev.WormaSounds",
    "~/Library/HTTPStorages/com.wormadev.WormaSounds.binarycookies",
    "~/Library/Preferences/com.wormadev.WormaSounds.plist",
  ]
end
