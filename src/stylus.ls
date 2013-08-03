require! {stylus, nib, "./compile"}

module.exports = compile \stylus (content, {file}) ->
  stylus(content).set("filename", file).use(nib()).import("nib").render()
