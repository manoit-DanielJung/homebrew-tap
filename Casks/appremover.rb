cask "appremover" do
  version "1.3.0"
  sha256 "7f1d48e06de5c4d9d3fb4277536fba97fd8e4be815bff2aa394550cbb0e25661"

  url "https://appremover.intentcode.co.kr/download/AppRemover-#{version}.dmg"
  name "AppRemover"
  desc "Uninstall apps together with their leftover files"
  homepage "https://appremover.intentcode.co.kr/"

  livecheck do
    skip "No version information available"
  end

  depends_on macos: :sonoma

  app "AppRemover.app"

  zap trash: [
    "~/Library/Preferences/kr.co.intentcode.appremover.plist",
    "~/Library/Saved Application State/kr.co.intentcode.appremover.savedState",
  ]
end
