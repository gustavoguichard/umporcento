#= require_self
#= require_tree ./helpers
#= require_tree ./models
#= require_tree ./collections
#= require_tree ./views
#= require ./router.js
#= require_tree ./pages

window.UmPorCento ?= {}
UmPorCento.Models ?= {}
UmPorCento.Views ?= {}
UmPorCento.Collections ?= {}
UmPorCento.Helpers ?= {}
UmPorCento.Router ?= {}
UmPorCento.Pages ?= {}
UmPorCento.EventDispatcher = _.extend {}, Backbone.Events

UmPorCento.App = 
  init: ->
    new UmPorCento.Views.WindowControl
    new UmPorCento.Views.MainMenu

$ ->
  action =  $('#init-js').data('action')
  if action is 'Home'
    UmPorCento.Pages.Home.init()
  UmPorCento.App.init()