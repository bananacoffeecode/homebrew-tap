cask "minikanban" do
  version "1.0.4"
  sha256 "fa17199aff91dcec9d0e878dc217df667e6c31680e1444c4520f2c0dda66fdce"

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
