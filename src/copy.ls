"use strict"

fs = require \fs
path = require \path
mkdir = require \mkdirp .sync
log = require "./log"

module.exports = (file) ->
  file = file.file if file.file?
  dirname = path.dirname file
  mkdir "build/#dirname" unless fs.existsSync "build/#dirname"
  log \@copy file
  fs.createReadStream "source/#file" .pipe fs.createWriteStream "build/#file"
