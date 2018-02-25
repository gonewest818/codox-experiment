(defproject codox-experiment "0.1.0-SNAPSHOT"
  :description "FIXME: write description"
  :url "http://example.com/FIXME"
  :license {:name "Eclipse Public License"
            :url "http://www.eclipse.org/legal/epl-v10.html"}
  :dependencies [[org.clojure/clojure "1.8.0"]]
  :plugins [[lein-codox "0.10.3"]]
  :codox {:output-path "gh-pages"
          :source-uri "https://github.com/gonewest818/codox-experiment/blob/master/{filepath}#L{line}"})
