Module = require './utils/module'

module.exports = class Response extends Module
  constructor: (req)->
    super
    Module.extend.call @, req
    @

  set_env: (env)->
    @.env = env
    @.request = env.request
