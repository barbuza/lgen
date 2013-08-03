require! {"./log"}

module.exports = (name, compiler) ->
  ({content}:ctx) ->
    log \@compile name
    ctx.content = compiler content, ctx
    ctx
