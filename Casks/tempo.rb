cask "tempo" do
  version "2.0.0"
  sha256 "9c8e0879e798d8ed180156b18498235bcc0fa3250f21fc71fce466c872377d1e"

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
