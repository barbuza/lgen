"use strict"

autoprefixer = require \autoprefixer
log = require "./log"

module.exports = ({content}:ctx) ->
  log "@render autoprefixer"
  ctx.content = autoprefixer.compile content
  ctx
