require! {jade, fs, "./log"}

module.exports = (name) ->
  ({template}:ctx) ->
    template = name or template
    throw Error "no template specified" unless template
    log \@render template
    tmpl = fs.read-file-sync "source/#{template}.jade" .to-string!
    ctx.content = jade.render tmpl, ctx
    ctx
