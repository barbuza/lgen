require! {livescript, "./log"}

module.exports = ({content}:ctx) ->
  log "@render livescript"
  ctx.content = livescript.compile content
  ctx
