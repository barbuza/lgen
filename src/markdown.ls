"use strict"

wmd = require \wmd
log = require "./log"

module.exports = ({content}:ctx) ->
  log "@render markdown"
  doc = wmd content, {
    preprocessors: [wmd.preprocessors.underscores,
                    wmd.preprocessors.fencedCodeBlocksHighlightJS,
                    wmd.preprocessors.metadata,
                    wmd.preprocessors.yaml-front-matter]
  }
  for key of doc.metadata
    ctx[key] = doc.metadata[key]
  ctx.content = doc.html
  ctx
