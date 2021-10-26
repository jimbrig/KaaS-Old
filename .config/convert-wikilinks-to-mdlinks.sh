#!/usr/bin/env bash

cd /mnt/c/users/jimmy/dev/obsidian/kaas
git checkout gh-pages
rm -r site
mkdir site
obsidian-export . site --ignore-file
git add site/** -f
git commit -m "create site directory with obsidian-export"
git push