cask "appremover" do
  version "1.5.0"
  sha256 "bb22993c6eddab250a621560728b44a0a713e9bf60cf36a8163e10857e0730d9"

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
