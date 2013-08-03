require! exec-sync
{read, markdown, jade, write, beautify, stylus, autoprefixer, cssmin, find-files} = require "./lib/lgen"

task \index ->
  read \index.md |> markdown {+pygments} |> jade \index |> beautify.html! |> write \.html

task \static ->
  read \style.styl |> stylus |> autoprefixer! |> cssmin |> write \.css

task \build ->
  exec-sync.run "git show master:README.md > source/index.md"
  invoke \index
  invoke \static
  exec-sync.run "rm source/index.md"
  exec-sync.run "cp build/index.html index.html"
  exec-sync.run "cp build/style.css style.css"
