require! {autoprefixer, "./log"}

module.exports = (...reqs) ->
  reqs = ["last 2 versions"] unless reqs.length
  ({content}:ctx) ->
    log \@autoprefixer reqs
    ctx.content = autoprefixer(...reqs).compile content
    ctx
