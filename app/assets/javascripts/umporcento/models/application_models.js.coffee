################################################################################
# MODELS
################################################################################
class UmPorCento.Models.AnimatedSection extends Backbone.Model
  defaults:
    activatePosition: 0
    animate: false
    offset: 0
    scrollTop: 0

  initialize: ->
    UmPorCento.EventDispatcher.on 'window:scrolled', @scrollTop

  scrollTop: (top = 0)=>
    @set 'scrollTop', top
    @set 'animate', @checkActivation()

  checkActivation: =>
    @get('scrollTop') >= (@get('activatePosition') - @get('offset'))