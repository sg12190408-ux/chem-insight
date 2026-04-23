#!/usr/bin/env bash
# 원본 폴더 → 공개 사이트 동기화 + GitHub 푸시
# 사용법: ./publish.sh ["커밋 메시지"]

set -euo pipefail

SRC="$HOME/Desktop/vscodestudy/화학2 수행평가"
DST="$HOME/Desktop/chem-insight-site"
MSG="${1:-자료 업데이트}"

cd "$DST"

echo "▶ 원본에서 복사 중…"
cp "$SRC/Chem_Insight_수행평가_대시보드.md" "$DST/"
cp "$SRC/Chem_Insight_주제_키워드_가이드.md" "$DST/"
cp "$SRC/Chem_Insight_예시_보고서_그린암모니아.md" "$DST/"
cp "$SRC/Chem_Insight_예시_보고서_그린암모니아.docx" "$DST/"
cp "$SRC/Chem_Insight_학생용_보고서_양식.md" "$DST/"
cp "$SRC/Chem_Insight_학생용_보고서_양식.docx" "$DST/"

if [[ -z "$(git status --porcelain)" ]]; then
  echo "✓ 변경 사항 없음. 종료."
  exit 0
fi

echo "▶ 변경 사항:"
git status --short

echo "▶ 커밋 + 푸시 중…"
git add -A
git commit -m "$MSG"
git push

echo "✓ 완료. GitHub Pages가 1~2분 내 반영됩니다."
