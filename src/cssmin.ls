require! {cssmin, "./compile"}

module.exports = compile \cssmin (content) ->
  cssmin content, 80
