#!/bin/bash

# ──────────────────────────────────────────────
#  Auto Push Script — Daily GitHub Contribution
#  Repo: HadHanns/HadHanns
# ──────────────────────────────────────────────

REPO_DIR="/Users/haddadhannansrg/Documents/GitHub/GitHub Profile/HadHanns"
LOG_FILE="$REPO_DIR/daily_log.md"
DATE=$(date '+%Y-%m-%d')
TIME=$(date '+%H:%M:%S')

cd "$REPO_DIR" || exit 1

# Pull dulu biar aman
git pull origin main --quiet

# Update daily log
if [ ! -f "$LOG_FILE" ]; then
  echo "# 📅 Daily Activity Log" > "$LOG_FILE"
  echo "" >> "$LOG_FILE"
  echo "> Auto-generated log untuk menjaga GitHub contribution tetap aktif." >> "$LOG_FILE"
  echo "" >> "$LOG_FILE"
fi

echo "- **$DATE** \`$TIME\` — Daily check-in ✅" >> "$LOG_FILE"

# Commit & push
git add "$LOG_FILE"
git commit -m "chore: daily auto-push [$DATE]"
git push origin main

echo "✅ Auto-push berhasil: $DATE $TIME"
