#!/bin/bash

npm install && npm run build

git checkout -f gh-pages

git pull origin gh-pages --rebase

cp -R docs/* .

git add .

git commit -am "publish docs"

git push -u origin gh-pages

git checkout master
