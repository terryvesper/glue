exec = require('child_process').exec

red = '\033[0;31m'
green = '\033[0;32m'
reset = '\033[0m'

execute = (message, command) ->
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

task 'build', 'Build glue npm package', ->
  execute 'Creating package.json', 'courier'
  execute  'Compiling loader', 'coffee -c index.coffee'
  execute 'Compiling src/*.coffee to lib', 'coffee -co lib src/*.coffee'

task 'publish', 'Publish glue to npm repository', ->
  #runner 'Publishing to npm', -> exec 'npm publish .'

task 'clean', 'Clean generated files', ->
  execute 'Removing package.json', 'rm -f package.json'
  execute 'Removing generated lib/*.js files', 'rm -f lib/*.js'
  execute 'Removing compiled tests', 'rm -f test/*.js'
  execute 'Removing coverage helpers', 'rm -rf lib-cov/'
  execute 'Removing loader', 'rm -f index.js'

task 'install', 'Install glue package from the current dir', ->
  invoke 'test'
  execute 'Installing with npm', 'npm install .'

task 'uninstall', 'Uninstall all glue packages from npm', ->
  execute 'Uninstalling with npm', 'npm uninstall glue'

task 'setup', 'Setup glue development packages', ->
  execute 'Installing coffee-script', 'npm install coffee-script'
  execute 'Installing courier', 'npm install courier'
  execute 'Installing expresso', 'npm install expresso'

task 'test', 'Compile and run all tests', ->
  invoke 'build'
  execute 'Running tests with expresso'
  , 'coffee -c test/*.coffee && expresso -I lib'

task 'test-cov', 'Compile and run all test with coverage analysis', ->
  invoke 'build'
  execute 'Running tests with expresso and node-jscoverage'
  , 'coffee -c test/*.coffee && expresso -I lib --cov'
