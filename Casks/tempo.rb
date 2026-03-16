cask "tempo" do
  version "1.0.0"

  if Hardware::CPU.arm?
    url "https://github.com/bananacoffeecode/tempo-time-tracker/releases/download/v#{version}/Tempo-#{version}-arm64.dmg"
    sha256 "80cd3d83ac49b51fbc716c873eb5574701d09648db81ea8a2a5dd9e7b39d618f"
  else
    url "https://github.com/bananacoffeecode/tempo-time-tracker/releases/download/v#{version}/Tempo-#{version}.dmg"
    sha256 "6a773b9438dde96e97ab80c5da040d3e53afd8a414753ea8f3e2c09e52b64baf"
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
