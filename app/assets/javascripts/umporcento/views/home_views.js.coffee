################################################################################
# VIEWS
################################################################################
class UmPorCento.Views.MainSlider extends Backbone.View
  el: '.home-slider'
  initialize: ->
    UmPorCento.EventDispatcher.on 'window:resized', @adjustHeight
    UmPorCento.EventDispatcher.on 'menu:toggle', @pauseToggle
    UmPorCento.EventDispatcher.on 'window:visibilitychanged', @visibilityChanged

  adjustHeight: (obj)=>
    @$el.height(obj.height) if obj.height

  pauseToggle: =>
    if $('body').hasClass 'menu-active'
      @$el.cycle('resume')
    else
      @$el.cycle('pause')

  visibilityChanged: (visibilityState)=>
    if visibilityState == "hidden"
      @$el.cycle('pause')
    else
      @$el.cycle('resume')