# codox-experiment

## Steps taken

1. `lein new codox-experiment`
2.  add `lein-codox` plugin to `project.clj` and configure output path

``` clojure
  :plugins [[lein-codox "0.10.3"]]
  :codox {:output-path "gh-pages"
          :source-uri "https://github.com/gonewest818/codox-experiment/blob/master/{filepath}#L{line}"}
```

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
9. stage, commit and push

This last series of steps checks out the subproject (which is a copy
of this one! we'll fix that next) into the directory `gh-pages` and
also adds a `.gitmodules` file to the parent.

Now we're going to configure the subproject to sit on a branch named
`gh-pages` which is a reserved name used by GitHub for project
websites.

10. `cd gh-pages`
11. Note: `git status` currently says "On branch master"
12. `git symbolic-ref HEAD refs/heads/gh-pages`
13. Note: `git status` now says "On branch gh-pages. No commits yet". However the checked-out files from step 8 are all still present and unstaged.
14. `rm ../.git/modules/gh-pages/index` and `git clean -fdx`
15. Note: At this point `ls -a` shows only a file named `.git`, and that file contains a single line `gitdir: ../.git/modules/gh-pages` as a reminder this is a submodule and the actual git configuration is above in the parent.
16. Note: `git status` now says "On branch gh-pages. No commits yet. nothing to commit"
17. create a file named `README.codox` with contents "This is `gh-pages`, the codox documentation branch."
18. `git add .` and `git commit -m "initial gh-pages branch"` and `git push -u origin gh-pages`

Now we have a second branch `gh-pages` with no parent, no history, and a single text file.

19. `cd ..`
20. Note: `git status` says "On branch master" and a modified file `gh-pages` which represents the fact we've changed the state of the submodule.
21. stage, commit, and push to master

Now we have updated the master branch with an updated submodule.



## License

Copyright © 2018 Neil Okamoto

Distributed under the Eclipse Public License either version 1.0 or (at
your option) any later version.
