#!/bin/bash
set -e

gzip -c index.json > index.json.gz

cat index.json

rsync -a --delete --exclude .git --exclude .gitignore .
git config --global user.email "github-actions[bot]@users.noreply.github.com"
git config --global user.name "github-actions[bot]"
git status
if [ -n "$(git status --porcelain)" ]; then
    git add .
    git commit -m "Updated radios"
    git push
else
    echo "No changes to commit"
fi
