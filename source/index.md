# lgen

0config static site generator for node.js

## prepare

### create a project

```bash
mkdir shiny-new-project && cd shiny-new-project
cat << EOF > package.json
{
  "name": "shiny-new-project",
  "version": "0.1.0"
}
EOF
npm install lgen --save-dev
```

### create build script

```bash
cat << EOF > Slakefile
{read, markdown, jade, stylus, autoprefixer, beautify, write, find-files, cssmin} = require \lgen
<-! task \build
find-files \*.md read >> markdown! >> jade(\default) >> beautify.html! >> write \.html
find-files \*.styl read >> stylus >> autoprefixer! >> cssmin >> write \.css
EOF
```

### create some source files

```bash
mkdir source
cat << EOF > source/index.md
# hey
## i'm rendered from markdown
EOF
cat << EOF > source/style.styl
body
  margin 0 auto
  width 960px
EOF
cat << EOF > source/default.jade
doctype 5
html(lang="en")
  head
    link(rel="stylesheet", href="style.css")
    title= title || basename
  body
    != content
EOF
```

## use
```bash
slake build
```

## roll your own build scenario
```livescript
{map, flip, each} = require \prelude-ls

{
  read, markdown, jade, copy, write, find-files,
  beautify, stylus, autoprefixer, livescript, cssmin,
  uglify-js, extend-ctx
} = require \lgen

write-html = beautify.html! >> write \.html

task \posts ->
  posts = find-files "????-??-??.md"
  names = map (.basename), posts
  set-post-attrs = extend-ctx ({basename}) ->
    idx = names.index-of basename
    prev: if idx > 0 then names[idx - 1] else void
    next: if idx < names.length then names[idx + 1] else void
  posts `flip(each)` (read >> set-post-attrs >> markdown! >> jade(\post) >> write-html)

task \index ->
  find-files \index.md read >> markdown({+pygments}) >> jade(\default) >> write-html

task \static ->
  find-files \*.styl read >> stylus >> autoprefixer! >> cssmin >> write \.css
  find-files \*.ls read >> livescript >> uglify-js >> write \.js
  find-files \*.png copy

task \build -> each invoke, <[static index posts]>
```
