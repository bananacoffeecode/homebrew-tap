cask "minikanban" do
  version "1.0.2"
  sha256 "91152e7ecdfc7280e3b9c16547be70afc2b8b63ddc61e0544bb0dbd4735a2c05"

  url "https://github.com/bananacoffeecode/minikanban/releases/download/v#{version}/Minikanban.zip"
  name "Minikanban"
  desc "Mac menu bar board and widget for tracking issues across product modules"
  homepage "https://github.com/bananacoffeecode/minikanban"

  app "Minikanban.app"

  postflight do
    system_command "/usr/bin/xattr",
      args: ["-dr", "com.apple.quarantine", "#{appdir}/Minikanban.app"],
      sudo: false
  end

  zap trash: [
    "~/Library/Application Support/Minikanban",
    "~/Library/Preferences/com.bananacoffeecode.Minikanban.plist",
  ]
end
