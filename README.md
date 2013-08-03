# lgen

0config static site generator for node.js

## prepare

### create a project

```
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

```
cat << EOF > Slakefile
{read, markdown, jade, stylus, autoprefixer, beautify, write, find-files, cssmin} = require \lgen
<-! task \build
find-files \*.md read >> markdown! >> jade(\default) >> beautify.html! >> write \.html
find-files \*.styl read >> stylus >> autoprefixer! >> cssmin >> write \.css
EOF
```

### create some source files

```
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
```
slake build
```