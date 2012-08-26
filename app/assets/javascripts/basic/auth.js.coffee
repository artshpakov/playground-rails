window.App ?= {}

class App.AuthView extends Backbone.View
  events:
    'click #auth-sign-in'   : 'signin'
    'click #auth-sign-out'  : 'signout'

  initialize: (options) ->
    _.bindAll @
    @on 'signin signout', @render
    @on 'signin', => @$('#auth-modal').modal 'hide'

  signin: ->
    $.ajax
      url     : @$('form').attr 'action'
      type    : 'post'
      data    : 'user': { 'login': @$('[name=login]').val(), 'password': @$('[name=password]').val() }
      success : (user_attributes) =>
        @trigger 'signin', user_attributes

  signout: ->
    $.ajax
      url     : @$('form').attr 'action'
      type    : 'delete'
    @trigger 'signout'

  render: (user_attributes={}) ->
    @$('#auth-handle').html JST['templates/auth'] user_attributes
    @
