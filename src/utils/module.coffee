moduleKeywords = ['included', 'extended']

module.exports = class Module
  @extend: (obj)->
    throw new Error('extend require obj as arguemnt') unless obj
    for name, value of obj when name not in moduleKeywords
      @[name] = value
    obj.extended.call @ if obj.extended?.call?
    @

  @include: (obj)->
    throw new Error('include require obj as argument') unless obj
    for name, value of obj when name not in moduleKeywords
      @::[name] = value
      obj.included.call @ if obj.included?.call?
    @

  @proxy: (func)->
    => func.apply @, arguments

  proxy: (func)->
    => func.apply @, arguments

  constructor: ->
    @initialize? arguments...
