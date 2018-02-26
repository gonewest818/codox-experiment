#!/bin/bash

hash=$(git rev-parse --short HEAD)
branch=$(git rev-parse --abbrev-ref HEAD)

# current branch must not have edits
git diff-index --quiet HEAD --
if [ "$?" == "1" ]; then
    echo "Branch \"$branch\" has uncommitted changes. Aborting."
    exit 1
fi

# submodules must be initialized and updated
sm=$(git submodule status gh-pages | cut -c1)
if [ "$sm" == "U" ]; then
    echo "Submodule has merge conflicts. Aborting."
    exit 1
elif [ "$sm" == "-" ]; then
    git submodule init gh-pages
    git submodule update gh-pages
fi

# checkout the gh-pages branch in the submodule
(cd gh-pages && \
     git checkout gh-pages && \
     git status || exit 1)

# now run codox to generate new docs
lein codox

## commit and push with a message to document
(cd gh-pages && \
    git add . && \
    git commit -m "codox: commit $hash on $branch" && \
    git push origin gh-pages || exit 1)
