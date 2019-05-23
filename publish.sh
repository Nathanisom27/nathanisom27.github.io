#!/bin/sh

cd "$(dirname $([ -L $0  ] && readlink -f $0 || echo $0))"
set -e

if [ -z "$(git status -s)" ]; then
    ./site/assets/img/desktops/make_thumbs.sh
    if [ ! -z "$(git status -s)" ]; then
	git add -u
	git commit -m "generate thumbs"
	git push origin source
    fi
else
    echo unclean git status
    exit 1
fi

# oof
# let's not talk about it

elisp "(org-static-blog-publish)"
# ?
sleep 2

rm -rf /tmp/notes.neeasade.net
cp -r site /tmp/notes.neeasade.net

git checkout master
rm -rf *
cp -r /tmp/notes.neeasade.net/* ./

git add --all
git commit -m "auto commit publish.sh"
git push origin master
git checkout source