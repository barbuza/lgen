require! {autoprefixer, "./compile"}

module.exports = (...reqs) ->
  reqs = ["last 2 versions"] unless reqs.length
  compile \autoprefixer (content) -> autoprefixer(...reqs).compile content
