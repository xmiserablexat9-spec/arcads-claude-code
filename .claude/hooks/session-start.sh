#!/bin/bash
set -euo pipefail

# Only run in remote (Claude Code on the web) environments
if [ "${CLAUDE_CODE_REMOTE:-}" != "true" ]; then
  exit 0
fi

# Install ffmpeg if missing
if ! command -v ffmpeg &>/dev/null; then
  apt-get install -y -q ffmpeg 2>/dev/null || true
fi

# Install Python dependencies for meta-ad-builder and whisper
pip install -q "requests>=2.31.0" "python-dotenv>=1.0.0" openai-whisper 2>/dev/null || true
