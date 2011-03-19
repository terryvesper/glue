topic = require 'glue_functions'

module.exports = 
  'execute is a function': ->
    topic.should.respondTo 'execute'
