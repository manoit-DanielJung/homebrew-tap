cask "appremover" do
  version "1.4.0"
  sha256 "598ba72660f8132b79c8d85d153ba5609f9fdeabc2429fc8e15a5b3a7efb63d4"

  url "https://appremover.intentcode.co.kr/download/AppRemover-#{version}.dmg"
  name "AppRemover"
  desc "Uninstall apps together with their leftover files"
  homepage "https://appremover.intentcode.co.kr/"

  livecheck do
    url "https://appremover.intentcode.co.kr/download/appcast.xml"
    strategy :sparkle, &:short_version
  end

  auto_updates true
  depends_on macos: :sonoma

  app "AppRemover.app"

  uninstall launchctl: "kr.co.intentcode.appremover.helper"

  zap trash: [
    "~/Library/Application Support/AppRemover",
    "~/Library/Preferences/kr.co.intentcode.appremover.plist",
    "~/Library/Saved Application State/kr.co.intentcode.appremover.savedState",
  ]
end
