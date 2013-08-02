"use strict"

js_beautify = require \js-beautify
log = require "./log"

beautify = (type, {content}:ctx) -->
  fun = switch type
  | \html => js_beautify.html
  | \css => js_beautify.css
  | \js => js_beautify
  | otherwise => ...
  log "@beautify #type"
  ctx.content = fun content, indent_size: 2, preserve_newlines: no, unformatted: <[pre code]>
  ctx

module.exports = {
  html: beautify \html
  css: beautify \css
  js: beautify \js
}
