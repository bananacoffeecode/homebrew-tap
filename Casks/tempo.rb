cask "tempo" do
  version "2.0.0"
  sha256 "d1fcbe6a21e366abb9e8cc67841f88c43b2d1837f27f1d2cc36f546359d87224"

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
