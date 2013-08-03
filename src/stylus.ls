require! {stylus, nib, "./log"}

module.exports = ({file, content}:ctx) ->
  log "@render stylus"
  ctx.content = stylus(content).set("filename", file).use(nib()).import("nib").render()
  ctx
