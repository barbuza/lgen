"use strict"

fs = require \fs
path = require \path
mkdir = require \mkdirp .sync
log = require "./log"

module.exports = (name, {content, basename}:ctx) -->
  if name.char-at(0) is \.
    throw Error "write by ext, no basename specified in ctx" unless basename
    name = basename + name
  log \@write name, \\n
  dirname = path.dirname name
  mkdir "build/#dirname" unless fs.existsSync "build/#dirname"
  fs.write-file-sync "build/#name", content
