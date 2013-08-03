require! {colors, "prelude-ls"}

module.exports = (...args) ->
  data = []
  for arg in prelude-ls.flatten args
    arg = arg.to-string!
    if arg.char-at(0) is \@
      data.push arg.substring 1
    else
      data.push arg.yellow
  data.push \\n
  process.stderr.write data * " "
