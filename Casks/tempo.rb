cask "tempo" do
  version "1.0.0"

  if Hardware::CPU.arm?
    url "https://github.com/bananacoffeecode/tempo-time-tracker/releases/download/v#{version}/Tempo-arm64.dmg"
    sha256 "REPLACE_WITH_ARM64_SHA256"
  else
    url "https://github.com/bananacoffeecode/tempo-time-tracker/releases/download/v#{version}/Tempo-x64.dmg"
    sha256 "REPLACE_WITH_X64_SHA256"
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
