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
{read, markdown, jade-layout, stylus, autoprefixer, beautify, write, find} = require \lgen
<-! task \build
find \*.md read >> markdown >> jade-layout(\default) >> beautify.html >> write \.html
find \*.styl read >> stylus >> autoprefixer >> beautify.css >> write \.css
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