#!/bin/bash

simplerepos="dotfiles shell-scripts"
httprepos="backend-zend-blog-3 zend-blog-2"

function update_git {
    git checkout master
    git pull origin master
    git fetch --prune
}

for repo in $simplerepos; do
    cd $repo
    update_git
    cd ..
done

for repo in $httprepos; do
    cd $repo/httpdocs
    update_git
    cd ../..
done

