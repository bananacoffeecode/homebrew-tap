cask "minikanban" do
  version "1.0.3"
  sha256 "1d414fc0ce13eb8f7c6fac0d9a6a9ba5ea5c01a13a26ac69e09de42a5c618b0a"

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
