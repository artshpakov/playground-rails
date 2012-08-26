#= require jquery
#= require jquery_ujs
#= require underscore
#= require backbone
#= require twitter/bootstrap
#= require_tree ./templates
#= require_tree .

window.App ?= {}

$ ->
  App.auth_view = new App.AuthView el: '#auth'
  App.auth_view.render App.current_user

  new App.Router
  Backbone.history.start()
