"use strict"

fs = require \fs
path = require \path
glob = require \glob

lib =  __filename |> fs.realpathSync |> path.dirname
ext = path.extname __filename

for filename in glob "*#ext", cwd: lib, sync: yes
  modname = path.basename filename, ext
  module.exports[modname] = require "./#modname"
