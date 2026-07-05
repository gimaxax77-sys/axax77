#!/bin/bash
set -euo pipefail

# Install dependencies so linting works in Claude Code (web/mobile) sessions.
# Runs from the repository root.
cd "$CLAUDE_PROJECT_DIR"

# Install project dev dependencies (htmlhint linter).
# `npm install` is preferred over `npm ci` so the cached container state is reused.
npm install --no-audit --no-fund
