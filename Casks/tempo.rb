cask "tempo" do
  version "1.1.0"

  if Hardware::CPU.arm?
    url "https://github.com/bananacoffeecode/tempo-time-tracker/releases/download/v#{version}/Tempo-#{version}-arm64.dmg"
    sha256 "2af55bac76e8931ff4a073c46a5fdb09419aaf33f629d51e854ef3058009a4c8"
  else
    url "https://github.com/bananacoffeecode/tempo-time-tracker/releases/download/v#{version}/Tempo-#{version}.dmg"
    sha256 "214e0bc64050070861539364f091b85ac3518eb36060dcd143c5451dc88dca6b"
  end

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
    "~/Library/Application Support/time-tracker",
    "~/Library/Preferences/com.sulakshana.tempo.plist",
  ]
end
