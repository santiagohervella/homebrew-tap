cask "letter-switch" do
  version "0.2"
  sha256 "3b8cf7b0892ff5c9b624f42f438130495c9563862c85f4cd25e59e7580dc8827"

  url "https://github.com/santiagohervella/letter-switch/releases/download/v#{version}/LetterSwitch.zip"
  name "LetterSwitch"
  desc "Keyboard-only app switcher: hold right option and press a letter"
  homepage "https://github.com/santiagohervella/letter-switch"

  depends_on macos: ">= :sequoia"

  app "LetterSwitch.app"

  postflight do
    system_command "/usr/bin/xattr", args: ["-dr", "com.apple.quarantine", "#{appdir}/LetterSwitch.app"]
    system_command "/usr/bin/open", args: ["#{appdir}/LetterSwitch.app"]
  end

  uninstall launchctl: "com.santiagohervella.letter-switch",
            delete:    "~/Library/LaunchAgents/com.santiagohervella.letter-switch.plist"
end
