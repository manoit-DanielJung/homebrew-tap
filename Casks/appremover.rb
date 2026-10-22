cask "appremover" do
  version "1.3.1"
  sha256 "7fc68868332496bfd8946468b80cc12c87ded87e6f80a6b3496737fa8b656c92"

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
