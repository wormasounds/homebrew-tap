cask "wormasounds" do
  version "0.1.0"
  sha256 "dc85bb38669dad0e7dee96b2c403e6fedb46bd0993f32d2697f7a4c6c4107e4e"

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
