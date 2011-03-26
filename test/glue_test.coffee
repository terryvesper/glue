glue = require 'glue'

module.exports = 
  'VERSION should be defined': ->
    glue.should.have.property 'VERSION'
  'VERSION should be a string': ->
    glue.VERSION.should.be.a 'string'
  'VERSION should not end with a newline': ->
    glue.VERSION[-1..-1].should.not.equal  '\n'
  'VERSION should be dotted digits': ->
    glue.VERSION.should.match /^\d+\.\d+\.\d+$/

  'cli should be an object': ->
    glue.cli.should.be.a 'object'
    
  'createApp should be a function': ->
    glue.createApp.should.be.a 'function'
