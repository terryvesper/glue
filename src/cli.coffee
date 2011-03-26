exec = require('child_process').exec

red = '\033[0;31m'
green = '\033[0;32m'
reset = '\033[0m'

# Log a message to the terminal
log = (message) ->
  console.log message if message isnt ''

# Handle child process output
execCallback = (message) ->
  (err, stdout, stderr) ->
    if err
      error message
      log "#{err.message or err}"
      log stdout
      process.exit 1
    else
      success message
      log stdout
      log stderr

# Execute a command and process output with execCallback
execute = (message, command) ->
  exec command, execCallback message

# Log a message with error formatting
error = (message) ->
  log "✗ #{red}#{message}#{reset}"

# Log a message with success formatting
success = (message) ->
  log "✓ #{green}#{message}#{reset}"

# Module contents
# TODO: execCallback is now only exported for tests :s
exports.execCallback = execCallback
exports.execute = execute
exports.error = error
exports.success = success
