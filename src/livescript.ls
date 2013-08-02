"use strict"

livescript = require \livescript
log = require "./log"

module.exports = ({content}:ctx) ->
  log "@render livescript"
  ctx.content = livescript.compile content
  ctx
