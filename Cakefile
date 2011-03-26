execute = require('./src/cli').execute

task 'build', 'Build glue npm package', ->
  execute 'Create package.json', 'courier'
  execute 'Compile loader', 'coffee -c index.coffee'
  execute 'Compile src to lib', 'coffee -co lib src/*.coffee'

task 'publish', 'Publish glue to npm repository', ->
  #runner 'Publishing to npm', -> exec 'npm publish .'

task 'clean', 'Clean generated files', ->
  execute 'Remove package.json', 'rm -f package.json'
  execute 'Remove generated lib dir', 'rm -rf lib'
  execute 'Remove compiled tests', 'rm -f test/*.js'
  execute 'Remove coverage helpers', 'rm -rf lib-cov/'
  execute 'Remove loader', 'rm -f index.js'

task 'install', 'Install glue package from the current dir', ->
  invoke 'test'
  execute 'Install with npm', 'npm install .'

task 'uninstall', 'Uninstall all glue packages from npm', ->
  execute 'Uninstall with npm', 'npm uninstall glue'

task 'setup', 'Setup glue development packages', ->
  execute 'Install coffee-script', 'npm install coffee-script'
  execute 'Install courier', 'npm install courier'
  execute 'Install expresso', 'npm install expresso'

task 'test', 'Compile and run all tests', ->
  invoke 'build'
  execute 'Run tests with expresso'
  , 'coffee -c test/*.coffee && expresso -I lib -r assert -r should'

task 'test-cov', 'Compile and run all test with coverage analysis', ->
  invoke 'build'
  execute 'Run tests with expresso and node-jscoverage'
  , 'coffee -c test/*.coffee && expresso -I lib --cov -r assert -r should'

task 'todo', 'Show todo notes', ->
  execute 'TODO list', 'grep TODO **/*.coffee' 
