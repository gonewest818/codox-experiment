(defproject codox-experiment "0.1.0-SNAPSHOT"
  :description "FIXME: write description"
  :url "http://example.com/FIXME"
  :license {:name "Eclipse Public License"
            :url "http://www.eclipse.org/legal/epl-v10.html"}
  :dependencies [[org.clojure/clojure "1.8.0"]]
  :plugins [[lein-codox "0.10.3"]]
  :codox #= (eval (let [repo   (or (System/getenv "REPO_SLUG")
                                   "gonewest818/codox-experiment")
                        branch (or (System/getenv "GIT_BRANCH")
                                   "master")]
                    {:output-path (str "gh-pages/" branch)
                     :source-url  (format "https://github.com/%s/blob/%s/{filepath}#L{line}"
                                          repo branch)})))
