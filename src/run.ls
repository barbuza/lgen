require! {exec-sync, "./log"}

module.exports = (command) ->
  log \@exec command
  exec-sync.exec command .stdout
