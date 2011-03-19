# Version string
exports.VERSION = VERSION = require('fs')
.readFileSync('./VERSION', 'utf8')[..-2]

exports.cli = require './glue_cli'
