#!/bin/bash
set -e

timestamp() { date -u +"%Y-%m-%dT%H-%M-%S"; }

echo "[deploy_prod] Compiling requirements.txt..."
uv pip compile pyproject.toml -o requirements.txt

# Get last production tag
LAST_TAG=$(git tag --list 'Production_*' --sort=-creatordate | head -n 1)

# Get commit messages since last tag
COMMITS=$(git log "$LAST_TAG"..HEAD --pretty=format:"- %s")

# Use `oa` to summarize commits
SUMMARY=$(echo "$COMMITS" | llm "Summarize these commit messages for a changelog:")

# Final message
TAG="Production_$(timestamp)"
MESSAGE="Release to production at $(timestamp) by $(whoami)\n\n$SUMMARY"

# Create annotated tag
git tag -a "$TAG" -m "$MESSAGE"
git push origin "$TAG"
echo "[deploy_prod] Tagged and pushed: $TAG"

# Append to changelog
echo -e "\n## $TAG\n$MESSAGE" >> CHANGELOG.md
echo "[deploy_prod] Appended to CHANGELOG.md"

# Deploy to Fly
fly deploy -c fly.prod.toml --no-cache --yes
