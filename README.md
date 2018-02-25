# codox-experiment

## Steps taken

1. `lein new codox-experiment` & add `lein-codox` plugin
2. configure codox output path to `gh-pages`
3. add `gh-pages` dir to `.gitignore`
4. `lein codox` to make sure docs go to the right place
5. stage, commit and push

At this point we have a source project w/ codox. Next step, add a
submodule to hold the published docs. However ... as an experiment
let's try to have the submodule be this same github project but
checkout a different branch.

6. rm `gh-pages` from `.gitignore`
7. `rm -rf gh-pages` if there is codox output there
8. `git submodule add git@github.com:gonewest818/codox-experiment.git gh-pages`

This last command checks out the subproject (which is a copy of this
one! we'll fix that next) into the directory `gh-pages` and also adds
a `.gitmodules` file to the parent.

9. stage, commit and push



## License

Copyright © 2018 Neil Okamoto

Distributed under the Eclipse Public License either version 1.0 or (at
your option) any later version.
