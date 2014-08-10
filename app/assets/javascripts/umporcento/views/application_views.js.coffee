################################################################################
# VIEWS
################################################################################
class UmPorCento.Views.WindowControl extends Backbone.View
  el: window
  events:
    'resize': 'resizedWindow'
  initialize: ->
    UmPorCento.EventDispatcher.on 'menu:clicked', @toggleMenu
    @body = $('body')
    @resizedWindow()

  toggleMenu: =>
    @body.toggleClass 'menu-active'

  resizedWindow: =>
    UmPorCento.EventDispatcher.trigger 'window:resized', {width: @$el.width(), height: @$el.height()}

class UmPorCento.Views.MainMenu extends Backbone.View
  el: '#main-menu'
  events: 'click .menu-toggl': 'clickedToggle'
  initialize: ->
    # UmPorCento.EventDispatcher.on 'window:resized', @windowResized

  clickedToggle: (ev)=>
    UmPorCento.EventDispatcher.trigger 'menu:clicked'