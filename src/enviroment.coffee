Module = require './utils/module'
Request = require './request'
Response = require './response'

module.exports = class Enviroment extends Module
  constructor: (request, response)->
    @request = new Request(request)
    @response = new Response(response)
    @request.set_env @
    @response.set_env @
