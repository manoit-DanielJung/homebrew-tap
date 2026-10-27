cask "appremover" do
  version "1.6.1"
  sha256 "9145c90e50c787ce9f14978f78cab3f7c36d8ba4af39e58dbaf3044363adb16d"

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

  # 관리자 도우미는 앱이 SMAppService로 등록·관리한다. uninstall(업그레이드 때도 실행됨)에서 내리면
  # macOS 설정에는 켜짐으로 남은 채 재부팅 전까지 응답하지 않으므로, 완전 삭제(zap) 때만 내린다.
  zap launchctl: "kr.co.intentcode.appremover.helper",
      trash:     [
        "~/Library/Application Support/AppRemover",
        "~/Library/Preferences/kr.co.intentcode.appremover.plist",
        "~/Library/Saved Application State/kr.co.intentcode.appremover.savedState",
      ]
end
