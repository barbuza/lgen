require! {livescript, "./compile"}

module.exports = compile \livescript (content) ->
  livescript.compile content
