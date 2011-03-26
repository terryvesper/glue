express = require 'express'

exports.create = (mapping) ->
  # Allow for custom directory mappings to be passed
  mapping = {base: mapping} if typeof mapping is 'string'

  app = express.createServer()

  # Use CoffeeKup markup
  app.register '.coffee', require('coffeekup')
  app.set 'view engine', 'coffee'
  
  # Make sure to return the app
  return app
