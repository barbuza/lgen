require! {cssmin, "./log"}

module.exports = ({content}:ctx) ->
  log "@minify css"
  ctx.content = cssmin content, 80
  ctx
