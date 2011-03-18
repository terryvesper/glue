# Version string
VERSION = require('fs').readFileSync('./VERSION', 'utf8')[..-2]
exports.VERSION = VERSION

# TODO: Expose? Use class? Expose class, createPacker?
css_packer = require './css_packer'
