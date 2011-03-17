assert = require 'assert'
glue = require 'glue'

module.exports = 
  'VERSION is defined': ->
    assert.isDefined glue.VERSION
  'VERSION is a string': ->
    assert.type glue.VERSION, 'string'
  'VERSION doesn\'t end with a newline': ->
    assert.notEqual glue.VERSION, "\n"
