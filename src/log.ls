"use strict"

require \colors
{flatten} = require \prelude-ls

module.exports = (...args) ->
  data = []
  for arg in flatten args
    if arg.char-at(0) is \@
      data.push arg.substring 1
    else
      data.push arg.yellow
  data.push \\n
  process.stderr.write data * " "
