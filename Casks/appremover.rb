cask "appremover" do
  version "1.2.0"
  sha256 "8f3ed56e433f56572103010562450a01b19e7ae721718e1086843fac89bff3f3"

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
