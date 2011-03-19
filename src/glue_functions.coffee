exec = require('child_process').exec

red = '\033[0;31m'
green = '\033[0;32m'
reset = '\033[0m'

exports.execute = (message, command) ->
  exec command
  , (error, stdout, stderr) ->
    if error
      console.log "✗ #{red}#{message}...#{reset}"
      console.log "#{error.message or error}" if error isnt ''
      console.log stdout
      process.exit(1)
    else
      console.log "✓ #{green}#{message}...#{reset}"
      console.log stdout if stdout isnt ''
      console.log stderr if stderr isnt ''
