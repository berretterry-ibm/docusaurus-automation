#!/bin/bash

echo What is the name of the project name?
read project
echo What is the name of the Orgonization?
read org


cat > assets/variables.js <<EOF
const vars = {
    repo: 'https://github.com/$org/$project.git',
    project: '$project',
    org: '$org'
};
module.exports = { vars };
EOF

repo=https://github.com/$org/$project.git

echo Cloning Respository
git clone $repo

echo Creating Docusaurus site
npx create-docusaurus@latest website mermaid

echo Installing extra packages
npm install --save carbon-components @cmfcmf/docusaurus-search-local @docusaurus/theme-mermaid

echo removing unessearry files
rm -r website/blog

rm -r website/docs

rm -r website/static/img

mkdir wesite/docs

cp assets/custom.css website/src/css/custom.css

cp assets/docusaurus.config.js website/docusaurus.config.js

cp assets/img website/static/img

python3 mdsplit.py README.md --max-level 2 --force --verbose website/docs

yarn build