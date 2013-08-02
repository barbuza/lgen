"use strict"

beautify = require \js-beautify
log = require "./log"

module.exports = (type, {content}:ctx) -->
  fun = switch type
  | \html => beautify.html
  | \css => beautify.css
  | \js => beautify
  | otherwise => ...
  log "@beautify #type"
  ctx.content = fun content, indent_size: 2
  ctx
