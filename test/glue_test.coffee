glue = require 'glue'

module.exports = 
  'VERSION is defined': ->
    glue.should.have.property 'VERSION'
  'VERSION is a string': ->
    glue.VERSION.should.be.a 'string'
  'VERSION doesn\'t end with a newline': ->
    glue.VERSION[-1..-1].should.not.equal  '\n'
