cask "tempo" do
  version "2.0.0"
  sha256 "e258ed27548d5d0eca0a2ea85c28e93d7f4d452651a3a8cd3d47e02cc3ba1065"

  url "https://github.com/bananacoffeecode/tempo-time-tracker/releases/download/v#{version}/Tempo.dmg"
  name "Tempo"
  desc "Mac menu bar time tracker that logs sessions to Google Calendar"
  homepage "https://github.com/bananacoffeecode/tempo-time-tracker"

  app "Tempo.app"

  postflight do
    system_command "/usr/bin/xattr",
      args: ["-dr", "com.apple.quarantine", "#{appdir}/Tempo.app"],
      sudo: false
  end

  zap trash: [
    "~/Library/Preferences/tempo.Tempo.plist",
  ]
end
