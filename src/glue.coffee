# Version string
VERSION = require('fs').readFileSync('./VERSION', 'utf8')[..-2]
exports.VERSION = VERSION
