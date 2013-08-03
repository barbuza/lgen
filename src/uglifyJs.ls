require! {"uglify-js", "./log"}

module.exports = ({content}:ctx) ->
  log "@uglify js"
  ctx.content = uglify-js.minify content, {+from-string} .code
  ctx
