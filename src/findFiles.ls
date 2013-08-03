require! {glob, path, "./log"}

module.exports = (pattern, fun) ->
  log \@find pattern
  files = glob pattern, sync: yes, cwd: \source
  for file in files
    ext = path.extname file
    basename = path.basename file, ext
    filedata = {ext, basename, file}
    if fun
      fun filedata
    else
      filedata
