cask "minikanban" do
  version "1.0.0"
  sha256 "945442928f492bad234e875a73b93008bd01cdde63467fe625badd0c8118c1dc"

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
