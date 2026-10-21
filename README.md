# IntentCode Homebrew Tap

[IntentCode](https://intentcode.co.kr)가 만든 macOS 앱을 [Homebrew](https://brew.sh)로 설치하는 탭입니다.

## AppRemover

맥 앱을 남은 파일(설정·캐시·자동 실행 항목)까지 함께 정리하는 앱 — <https://appremover.intentcode.co.kr>

```sh
brew install --cask manoit-DanielJung/tap/appremover
```

업데이트와 삭제:

```sh
brew upgrade --cask appremover
brew uninstall --cask appremover          # 앱만 지우기
brew uninstall --cask --zap appremover    # 앱 설정 파일까지 지우기
```

설치한 뒤에는 **시스템 설정 › 개인정보 보호 및 보안**에서 AppRemover의 「전체 디스크 접근 권한」과 「앱 관리」를 켜 주세요.

## 새 버전 반영 (관리자용)

1. 앱 저장소의 `app-remover/release.sh`로 서명·공증된 `AppRemover-X.Y.Z.dmg`를 만들고, 사이트 버킷의 `download/`에 올립니다(appremover-site README의 「DMG 올리기」).
2. 이 저장소에서 `develop`으로부터 브랜치를 만들고 cask의 버전과 해시를 바꿉니다:

   ```sh
   scripts/bump-appremover.sh ~/path/to/AppRemover-X.Y.Z.dmg
   ```

   스크립트는 배포된 DMG의 해시가 같은지도 확인합니다.
3. `develop`으로 PR(squash) → `develop` → `main` PR(merge commit). 사용자는 `main`의 cask를 받습니다.

## 브랜치 규칙

`main`/`develop` 직접 push 금지(ruleset), PR + 필수 검사 `cask`(`brew style`).
