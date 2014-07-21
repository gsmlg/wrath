Enviroment = require './enviroment'
Q = require 'q'

exports.Enviroment = Enviroment

exports.run = (app)->
  http = require 'http'
  http.createServer (req,res)->
    env = new Enviroment(req, res)
    __middlewares__.forEach (middle)-> middle.call env
    end = app.call env
    if Array.isArray end
      res.writeHead end[0], end[1]
      res.end end[2]
    else if end.done?
      end.done (send)->
        [status, header, body] = send
        res.statusCode = status
        for key, value of header
          res.setHeader key, value
        res.end body
  .listen process.env.PORT || 3000

exports.create = ->
  (req, res)->
    new Enviroment(req, res)

__middlewares__ = []

exports.use = (middleware)->
  __middlewares__.push middleware
