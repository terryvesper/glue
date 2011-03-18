less = require 'less'

class CSSPacker
  constructor: (@config) ->
    @parser = new less.Parser

  createPack: ->
    @parser.parse()

exports.CSSPacker = CSSPacker

# Generate a CSS Pack according to the config
generate = (config) ->
  new CSSPacker(config).createPack()

exports.generate = generate
