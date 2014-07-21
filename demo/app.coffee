wrath = require '../lib'

md =
  call: (env)->
    path = env.request.url
    env.query = path

class App
  call: (env)->
    @handle env
    [200, {"x-powered-by":"wrath"}, "Hello World!\n#{env.query}\n"]

  handle: (env)->
    url = env.request.url

app = new App

wrath.use md

wrath.run app
