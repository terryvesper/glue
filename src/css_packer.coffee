less = require 'less'

class CSSPacker
  constructor: (@dir) ->
    @parser = new less.Parser

  createPack: ->
    @parser.parse()

exports.CSSPacker = CSSPacker
