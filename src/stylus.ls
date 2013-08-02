"use strict"

stylus = require \stylus
log = require "./log"

module.exports = ({file, content}:ctx) ->
  log "@render stylus"
  stylus.render content, filename: file, (_, css) -> ctx.content = css
  ctx
