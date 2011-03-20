module.exports = class ConnectionPool
  constructor: ->
    @pool = {}

  get: (name) ->
    @pool[name]# || @pool[name] = new Connection(name)
    
