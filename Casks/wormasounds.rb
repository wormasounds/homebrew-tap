cask "wormasounds" do
  version "0.1.1"
  sha256 "d9974a7285921956f149f55141c851213b81ce453ff3eb08ce5e571ccffc36eb"

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
