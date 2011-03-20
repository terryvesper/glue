# Version string
exports.VERSION = VERSION = require('fs')
.readFileSync('./VERSION', 'utf8')[..-2]

# Command line aids for Cakefile and bin
exports.cli = require './modules/glue_cli'

# Create a global object for share pools.
global._glue = {}

# Create the global connection pool
ConnectionPool = require('./classes/connection_pool')
exports.ConnectionPool = ConnectionPool
_glue.connectionPool = new ConnectionPool()
