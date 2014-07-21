// Generated by CoffeeScript 1.7.1
var Enviroment, __middlewares__;

Enviroment = require('./enviroment');

exports.Enviroment = Enviroment;

exports.run = function(app) {
  var http;
  http = require('http');
  return http.createServer(function(req, res) {
    var end, env, key, val, _ref;
    env = new Enviroment(req, res);
    __middlewares__.forEach(function(middle) {
      return middle.call(env);
    });
    end = app.call(env);
    if (Array.isArray(end)) {
      res.statusCode = end[0];
      _ref = end[1];
      for (key in _ref) {
        val = _ref[key];
        res.setHeader(key, val);
      }
      return res.end(end[2]);
    } else if (end.done != null) {
      return end.done(function(send) {
        var body, header, status, value;
        status = send[0], header = send[1], body = send[2];
        res.statusCode = status;
        for (key in header) {
          value = header[key];
          res.setHeader(key, value);
        }
        return res.end(body);
      });
    }
  }).listen(process.env.PORT || 3000);
};

exports.create = function() {
  return function(req, res) {
    return new Enviroment(req, res);
  };
};

__middlewares__ = [];

exports.use = function(middleware) {
  return __middlewares__.push(middleware);
};