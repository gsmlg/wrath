describe 'env test', ->
    wrath = require '../lib'
    should = require 'should'

    it 'create', ->
        app = wrath.create()
        app.length.should.equal 2

