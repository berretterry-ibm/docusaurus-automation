#!/bin/bash

echo Enter the repository URL

read repo

git clone $repo

npx create-docusaurus@latest website mermaid

npm install --save carbon-components @cmfcmf/docusaurus-search-local @docusaurus/theme-mermaid

rm -r website/blog

rm -r website/docs

mkdir wesite/docs

python3 mdsplit.py README.md --max-level 2 --force --verbose website/docs