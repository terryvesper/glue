exec = require('child_process').exec

red = '\033[0;31m'
green = '\033[0;32m'
reset = '\033[0m'

# Log process information
execLogger = (message) ->
  (error, stdout, stderr) ->
    if error
      console.log "✗ #{red}#{message}...#{reset}"
      console.log "#{error.message or error}" if error isnt ''
      console.log stdout
      process.exit(1)
    else
      console.log "✓ #{green}#{message}...#{reset}"
      console.log stdout if stdout isnt ''
      console.log stderr if stderr isnt ''

task 'build', 'Build glue npm package', ->
  exec 'courier', execLogger 'Creating package.json'
  exec 'coffee -c index.coffee', execLogger 'Compiling loader'
  exec 'coffee -co lib src/*.coffee'
  , execLogger 'Compiling src/*.coffee to lib'

task 'publish', 'Publish glue to npm repository', ->
  #runner 'Publishing to npm', -> exec 'npm publish .'

task 'clean', 'Clean generated files', ->
  exec 'rm -f package.json', execLogger 'Removing package.json'
  exec 'rm -f lib/*.js'
  , execLogger 'Removing generated lib/*.js files'
  exec 'rm -f test/*.js', execLogger 'Removing compiled tests'
  exec 'rm -rf lib-cov/', execLogger 'Removing coverage helpers'
  exec 'rm -f index.js', execLogger 'Removing loader'

task 'install', 'Install glue package from the current dir (using npm)'
, ->
  invoke 'test'
  exec 'npm install .', execLogger 'Installing with npm'

task 'uninstall', 'Uninstall all glue packages from npm', ->
  exec 'npm uninstall glue', execLogger 'Uninstalling with npm'

task 'setup', 'Setup glue development packages', ->
  exec 'npm install coffee-script'
  , execLogger 'Installing coffee-script'
  exec 'npm install courier', execLogger 'Installing courier'
  exec 'npm install expresso', execLogger 'Installing expresso'

task 'test', 'Compile and run all tests', ->
  invoke 'build'
  exec 'coffee -c test/*.coffee && expresso -I lib'
  , execLogger 'Running tests with expresso'

task 'test-cov', 'Compile and run all test with coverage analysis', ->
  invoke 'build'
  exec 'coffee -c test/*.coffee && expresso -I lib --cov'
  , execLogger 'Running tests with expresso and node-jscoverage'
