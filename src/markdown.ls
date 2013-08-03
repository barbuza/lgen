require! {wmd, exec-sync, temp, fs, "./log"}

escape-html = (s) ->
  s.to-string!
  .replace /&/g  '&amp;'
  .replace /</g '&lt;'
  .replace />/g '&gt;'
  .replace /"/g '&quot;'
  .replace /'/g '&#39;'

fenced-code-blocks-pygments = (doc) ->
  re1 = /```([A-Za-z]+)\s*([\s\S]+?)```/
  re2 = /```\s*([\s\S]+?)```/
  while block = re1.exec(doc.markdown) or re2.exec(doc.markdown)
    highlighted = if block.length is 3
      path = temp.path!
      log \@pygmentize block.1
      fs.write-file-sync path, block.2
      {stdout} = exec-sync.exec "pygmentize -l #{block.1} -f html -P linenos=table -P cssclass=hll #{path}"
      fs.unlink-sync path
      stdout
    else
      "<pre><code>#{escape-html block.1}</code></pre>"
    doc.markdown = doc.markdown.substr(0, block.index) + highlighted + doc.markdown.substr(block.index + block.0.length)
  doc

module.exports = ({pygments=no}={}) ->
  ({content}:ctx) ->
    log "@render markdown" JSON.stringify {pygments}
    higlight = if pygments then
      fenced-code-blocks-pygments
    else
      wmd.preprocessors.fenced-code-blocks-highlight-JS
    doc = wmd content, {
      preprocessors: [wmd.preprocessors.underscores,
                      higlight,
                      wmd.preprocessors.metadata,
                      wmd.preprocessors.yaml-front-matter]
    }
    for key of doc.metadata
      ctx[key] = doc.metadata[key]
    ctx.content = doc.html
    ctx
