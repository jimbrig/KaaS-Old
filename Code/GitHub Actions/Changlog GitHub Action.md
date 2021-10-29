---
Date: 2021-10-28
Author: Jimmy Briggs <jimmy.briggs@jimbrig.com>
Alias: Changelog.yml
---

Source Type: #Type/Code 

# Changlog GitHub Action

*Source: [Mara-Li/Obsidian-Snippet-collection - changelog.yml](https://github.com/Mara-Li/Obsidian-Snippet-collection/blob/main/.github/workflows/changelog.yml)*

```yaml
name: Changelog
on:
  push:
    branches: [ main ]
  pull_request:
    branches: [ main ]

jobs:
  generate_changelog:
    runs-on: ubuntu-latest
    name: Generate changelog for master branch
    steps:
      - uses: actions/checkout@v1

      - name: Generate changelog
        uses: charmixer/auto-changelog-action@v1
        with:
          token: ${{ secrets.GITHUB_TOKEN }}

      - name: Commit files
        env:
          CI_USER: ${{ secrets.USER }}
          CI_EMAIL: ${{ secrets.EMAIL }}
        run: |
          git config --local user.email "$CI_EMAIL"
          git config --local user.name "$CI_USER"
          git add CHANGELOG.md && git commit -m 'Updated CHANGELOG.md' && echo "push=true" >> $GITHUB_ENV || echo "No changes to CHANGELOG.md"
      - name: Push changes
        if: env.push == 'true'
        env:
          CI_USER: ${{ secrets.USER }}
          CI_TOKEN: ${{ secrets.GITHUB_TOKEN }}
        run: |
          git push "https://$CI_USER:$CI_TOKEN@github.com/$GITHUB_REPOSITORY.git" HEAD:main
```

***

Backlinks:
-	