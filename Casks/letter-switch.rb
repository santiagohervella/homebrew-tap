cask "letter-switch" do
  version "0.3"
  sha256 "6779550ebaffc98abf8af347cadd3fb71dea9eee2f942aafcceed02adbad8e09"

  url "https://github.com/santiagohervella/letter-switch/releases/download/v#{version}/LetterSwitch.zip"
  name "LetterSwitch"
  desc "Keyboard-only app switcher: hold right option and press a letter"
  homepage "https://github.com/santiagohervella/letter-switch"

  depends_on macos: :sequoia

  app "LetterSwitch.app"

  postflight_steps do
    run "/usr/bin/xattr", args: ["-dr", "com.apple.quarantine", "{{appdir}}/LetterSwitch.app"]
    run "/usr/bin/open", args: ["{{appdir}}/LetterSwitch.app"]
  end

  uninstall launchctl: "com.santiagohervella.letter-switch"
end
