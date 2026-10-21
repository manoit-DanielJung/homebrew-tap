#!/bin/bash
# 새 AppRemover DMG 를 내면 cask 의 version 과 sha256 을 바꾼다.
#   사용: scripts/bump-appremover.sh <AppRemover-X.Y.Z.dmg 경로>
# DMG 는 release.sh 가 만든 Developer ID 서명·공증본이어야 하고,
# 같은 파일을 https://appremover.intentcode.co.kr/download/AppRemover-X.Y.Z.dmg 에 올려야 한다.
set -euo pipefail
cd "$(dirname "$0")/.."

dmg="${1:?usage: $0 <AppRemover-X.Y.Z.dmg>}"
version=$(basename "$dmg" | sed -nE 's/^AppRemover-([0-9]+(\.[0-9]+)*)\.dmg$/\1/p')
[ -n "$version" ] || { echo "✖ 파일 이름이 AppRemover-X.Y.Z.dmg 형식이 아닙니다: $dmg"; exit 1; }
sha=$(shasum -a 256 "$dmg" | awk '{print $1}')

cask=Casks/appremover.rb
sed -i '' -E "s/^  version \".*\"/  version \"$version\"/; s/^  sha256 \".*\"/  sha256 \"$sha\"/" "$cask"
echo "✔ $cask → version $version, sha256 $sha"

url="https://appremover.intentcode.co.kr/download/AppRemover-$version.dmg"
if remote=$(curl -fsSL "$url" | shasum -a 256 | awk '{print $1}') && [ "$remote" = "$sha" ]; then
  echo "✔ 배포된 DMG 와 해시가 같습니다: $url"
else
  echo "⚠ $url 이 아직 없거나 해시가 다릅니다. DMG 를 올린 뒤 cask 를 머지하세요."
fi
