cask "minikanban" do
  version "1.0.1"
  sha256 "606ba6ca6f68f9d1a51cbd2a304c50b03d1a480346113fd23d7268a464760254"

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
