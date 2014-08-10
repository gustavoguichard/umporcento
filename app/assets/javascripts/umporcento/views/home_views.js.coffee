################################################################################
# VIEWS
################################################################################
class UmPorCento.Views.MainSlider extends Backbone.View
  el: '.home-slider'
  initialize: ->
    UmPorCento.EventDispatcher.on 'window:resized', @adjustHeight

  adjustHeight: (obj)=>
    @$el.height(obj.height) if obj.height