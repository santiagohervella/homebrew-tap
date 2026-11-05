cask "letter-switch" do
  version "0.0"
  sha256 "0000000000000000000000000000000000000000000000000000000000000000"

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
