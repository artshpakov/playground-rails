window.App ?= {}

class App.Router extends Backbone.Router
  routes:
    "": "home"

  initialize: (options) ->

  home: ->
