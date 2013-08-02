"use strict"

jade = require \jade
fs = require \fs
log = require "./log"

module.exports = (name, ctx) -->
  log "@render in layout" name
  tmpl = fs.read-file-sync "source/#{name}.jade" .to-string!
  ctx.content = jade.render tmpl, ctx
  ctx
