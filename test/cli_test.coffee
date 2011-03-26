topic = require 'cli'

# This returns log messages instead of printing to console :)
console.log = (message) -> message

# Don't exit on errors
process.exit = -> return 'halted'

# try/catch wrap a function call
trycatch = (f,a) -> 
  try 
    f(a...) 
  catch e 
    e

# Hook the actual process spawn and not have to worry about what we
# return. It's ugly but my OCD with 100% > nice code.
process.binding('child_process').ChildProcess.prototype.spawn = 
(path, args, rest...) -> 
  throw args

module.exports = 
  'execute should be a function': ->
    topic.should.respondTo 'execute'
  'execute should run exec with the supplied command': ->
    trycatch(topic.execute, ['msg', 'cmd'])[1].should.equal 'cmd'      

  # TODO: still missing tests for logging of stdout and calling of
  # error/success. Should try to assert inside console.log...
  'execCallback should be a function': ->
    topic.execCallback.should.be.a 'function'
  'execCallback should return a function': ->
    topic.execCallback('msg').should.be.a 'function'
  'execCallback should halt on error': ->
    topic.execCallback('msg')(true, null, null).should.equal 'halted'
  'execCallback should log stderr': ->
    topic.execCallback('msg')(null, 'a', 'b').should.equal 'b'

  'error should be a function': ->
    topic.should.respondTo 'error'
  'error should return the message in red': ->
    topic.error('test').should.include.string '[0;31mtest'
  'error should end with an ANSI reset': ->
    topic.error('test').should.match /\[0m$/
  'error should start with ✗': ->
    topic.error('test').should.match /^✗/

  'success should be a function': ->
    topic.should.respondTo 'success'
  'success should return the message in green': ->
    topic.success('test').should.include.string '[0;32mtest'
  'success should end with an ANSI reset': ->
    topic.success('test').should.match /\[0m$/
  'success should start with ✓': ->
    topic.success('test').should.match /^✓/
