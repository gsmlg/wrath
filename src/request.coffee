Module = require './utils/module'

module.exports = class Request extends Module
  constructor: (req)->
    super
    Module.extend.call @, req
    @

  set_env: (env)->
    for key, value of @headers
      name = ('http_' + key.replace('-', '_')).toUpperCase()
      env[name] = value
