#= require jquery
#= require jquery_ujs
#= require underscore
#= require backbone
#= require twitter/bootstrap
#= require_tree .

window.App ?= {}

$ ->
  new App.Router
  Backbone.history.start()
