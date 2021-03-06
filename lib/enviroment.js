// Generated by CoffeeScript 1.7.1
var Enviroment, Module, Request, Response,
  __hasProp = {}.hasOwnProperty,
  __extends = function(child, parent) { for (var key in parent) { if (__hasProp.call(parent, key)) child[key] = parent[key]; } function ctor() { this.constructor = child; } ctor.prototype = parent.prototype; child.prototype = new ctor(); child.__super__ = parent.prototype; return child; };

Module = require('./utils/module');

Request = require('./request');

Response = require('./response');

module.exports = Enviroment = (function(_super) {
  __extends(Enviroment, _super);

  function Enviroment(request, response) {
    this.request = new Request(request);
    this.response = new Response(response);
    this.request.set_env(this);
    this.response.set_env(this);
  }

  return Enviroment;

})(Module);
