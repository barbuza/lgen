require! {"js-beautify", "./log"}

beautify = (type) ->
  ({indent_size=2}={}) ->
    ({content}:ctx) ->
      fun = switch type
      | \html => js-beautify.html
      | \css => js-beautify.css
      | \js => js-beautify
      | otherwise => ...
      log "@beautify #type" JSON.stringify {indent_size}
      ctx.content = fun content, {
        indent_size,
        preserve_newlines: no,
        wrap_line_length: 80,
        unformatted: <[pre code]>
      }
      ctx

module.exports = {
  html: beautify \html
  css: beautify \css
  js: beautify \js
}
