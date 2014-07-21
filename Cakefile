{print} = require 'util'
{spawn} = require 'child_process'

task 'build', 'Build lib/ from src/', ->
  coffee = spawn 'node_modules/.bin/coffee', ['-b', '-c', '-o', 'lib', 'src']
  coffee.stderr.on 'data', (data) ->
    process.stderr.write data.toString()
  coffee.stdout.on 'data', (data) ->
    print data.toString()
  coffee.on 'exit', (code) ->
    callback?() if code is 0

task 'watch', 'Watch src/ for changes', ->
  coffee = spawn 'node_modules/.bin/coffee', ['-b', '-w', '-c', '-o', 'lib', 'src']
  coffee.stderr.on 'data', (data) ->
    process.stderr.write data.toString()
  coffee.stdout.on 'data', (data) ->
    print data.toString()

task 'test', 'run mocha test in test/', ->
  options = [
    '--compilers', 'coffee:coffee-script/register'
    '--reporter', 'spec'
  ]
  coffee = spawn 'node_modules/.bin/mocha', options
  coffee.stderr.on 'data', (data) ->
    process.stderr.write data.toString()
  coffee.stdout.on 'data', (data) ->
    print data.toString()
  coffee.on 'exit', (code) ->
    callback?() if code is 0

task 'testing', 'run mocha test in test/', ->
  options = [
    '--watch',
    '--compilers', 'coffee:coffee-script/register'
  ]
  coffee = spawn 'node_modules/.bin/mocha', options
  coffee.stderr.on 'data', (data) ->
    process.stderr.write data.toString()
  coffee.stdout.on 'data', (data) ->
    print data.toString()
  coffee.on 'exit', (code) ->
    callback?() if code is 0


