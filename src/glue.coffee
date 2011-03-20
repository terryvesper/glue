# Version string
exports.VERSION = VERSION = require('fs')
.readFileSync('./VERSION', 'utf8')[..-2]

# Command line aids for Cakefile and bin
exports.cli = require './glue_cli'

exports
