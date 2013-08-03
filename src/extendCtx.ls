require! "./log"

module.exports = (fun) ->
  (ctx) ->
    for key, value of fun ctx
      if typeof value isnt \undefined
        log \@set key, \@to value
        ctx[key] = value
    ctx
