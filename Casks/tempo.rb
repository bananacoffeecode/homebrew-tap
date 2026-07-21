cask "tempo" do
  version "2.0.0"
  sha256 "df31f624cbdf0ef380da53a20727f5f52a7a8e936c95bc54f68c2cac4f1169e2"

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
