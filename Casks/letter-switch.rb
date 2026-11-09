cask "letter-switch" do
  version "0.2"
  sha256 "3b8cf7b0892ff5c9b624f42f438130495c9563862c85f4cd25e59e7580dc8827"

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
