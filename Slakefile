require! exec-sync
{read, markdown, jade, write, beautify, stylus, autoprefixer, cssmin, find-files} = require "./lib/lgen"

task \index ->
  read \index.md |> markdown {+pygments} |> jade \index |> beautify.html! |> write \.html

task \static ->
  read \style.styl |> stylus |> autoprefixer! |> cssmin |> write \.css

task \build ->
  exec-sync.exec "git show master:README.md > source/index.md"
  invoke \index
  invoke \static
  process.stderr.write exec-sync.exec("cp -v build/index.html index.html").stdout
  process.stderr.write exec-sync.exec("cp -v build/style.css style.css").stdout
