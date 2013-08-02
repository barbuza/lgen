"use strict"

glob = require \glob
path = require \path
log = require "./log"

module.exports = (pattern, fun) -->
  log \@find pattern
  files = glob pattern, sync: yes, cwd: \source
  for file in files
    ext = path.extname file
    basename = path.basename file, ext
    fun {ext, basename, file}
