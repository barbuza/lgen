require! {fs, path, "./log"}

module.exports = (file) ->
  file = file.file if file.file?
  log \@read file
  ext = path.extname file
  basename = path.basename file, ext
  content = fs.read-file-sync "source/#file" .to-string!
  {content, basename, file, ext}
