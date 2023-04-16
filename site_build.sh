#!/bin/bash

echo Enter the repository URL

read repo

git clone $repo

npx create-docusaurus@latest website mermaid

npm install --save carbon-components @cmfcmf/docusaurus-search-local @docusaurus/theme-mermaid

rm -r website/blog

rm -r website/docs

mkdir wesite/docs

cp assets/custom.css website/src/css/custom.css

cp assets/docusaurus.config.js website/docusaurus.config.js

cp assets/img website/static/img

python3 mdsplit.py README.md --max-level 2 --force --verbose website/docs