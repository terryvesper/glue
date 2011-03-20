exports.Model = class Model
  constructor: (@adapter) ->
    # TODO: fetch the adapter connection from a pool?
    # if global._glue.adapterPool[@adapter]
