"use strict"

log = require "./log"

module.exports = (name) ->
  (value, ctx) -->
    log \@set name, \@to value
    ctx[name] = value
    ctx
