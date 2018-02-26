#!/bin/bash -x

# prep the `gh-pages` submodule
# is there a way to check if these have already been done?
# what happens if there are files in gh-pages/

# result prefixed with "-" if submodule is not initialized, "+" if the
# currently checked out submodule commit does not match the index of
# the containing repository, and "U" if the submodule has merge
# conflicts.
sm=$(git submodule status gh-pages | cut -c1)
if [ "$sm" == "U" ]; then
    echo "submodule has merge conflicts. cannot continue."
    exit 1
elif [ "$sm" == "-" ]; then
    git submodule init gh-pages && git submodule update gh-pages || exit 1
fi

# checkout gh-pages branch
cd gh-pages && \
    git checkout gh-pages && \
    git status || exit 1

# update docs and confirm status
lein codox

## commmit and push
hash=$(git rev-parse --short HEAD)
branch=$(git rev-parse --abbrev-ref HEAD)
cd gh-pages && \
    git add . && \
    git commit -m "docs for commit $hash on branch $branch " && \
    git push origin gh-pages || exit 1
