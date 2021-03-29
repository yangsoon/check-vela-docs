#!/bin/sh -l

set -e

git clone --single-branch --depth 1 $1 git-page

echo "sidebars updates"
cat $2/sidebars.js > git-page/sidebars.js

echo "docusaurus.config updates"
cat $2/docusaurus.config.js >  git-page/docusaurus.config.js

echo "index info updates"
cat $2/index.js > git-page/src/pages/index.js

echo "clear en docs"
rm -r git-page/docs/*
echo "clear zh docs"
rm -r git-page/i18n/zh/docusaurus-plugin-content-docs/*
echo "clear resources"
rm -r git-page/resources/*

echo "update resources"
cp -R $2/resources/* git-page/resources/

echo "update docs"
cp -R $2/en/* git-page/docs/
cp -R $2/zh-CN/* git-page/i18n/zh/docusaurus-plugin-content-docs/

echo "check docs"
cd git-page

echo "install node package"
yarn add nodejieba
if [ -e yarn.lock ]; then
yarn install --frozen-lockfile
elif [ -e package-lock.json ]; then
npm ci
else
npm i
fi

echo "run build"
npm run build