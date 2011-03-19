topic = require 'glue_cli'

module.exports = 
  'execute is a function': ->
    topic.should.respondTo 'execute'
  'error is a function': ->
    topic.should.respondTo 'error'
  'success is a function': ->
    topic.should.respondTo 'success'
