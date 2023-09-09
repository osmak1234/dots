#!/usr/bin/env bash

# this scipt is used to git add, commit and push

# git add
git add .

# git commit
read -p "Please input the commit message: " message

git commit -m "$message"

# git push
git push origin master
