require! {"uglify-js", "./compile"}

module.exports = compile \uglify-js (content) ->
  uglify-js.minify content, {+from-string} .code
