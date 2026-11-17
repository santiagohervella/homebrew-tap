cask "letter-switch" do
  version "0.3.1"
  sha256 "8665f16758e4fb1e637207ad5c437f0e8dd8cc4960311178a90a7523d2821935"

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
