cask "appremover" do
  version "1.1.0"
  sha256 "0658bd5ba2e0c21b22c28311caa9c5a5b6deddf2798ecd57f4fbf71c133a98f7"

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
