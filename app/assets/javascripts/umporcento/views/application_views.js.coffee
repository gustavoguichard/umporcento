################################################################################
# VIEWS
################################################################################
# Everything related to Window, Document and Body listeners and triggers
class UmPorCento.Views.WindowControl extends Backbone.View
  el: window
  events:
    'resize': 'resizedWindow'
    'scroll': 'docScrolled'
  initialize: ->
    UmPorCento.EventDispatcher.on 'menu:toggle', @toggleMenu
    document.addEventListener @getVisibilityByBrowser(), @changedVisibility
    @body = $('body')
    @resizedWindow()

  getVisibilityByBrowser: =>
    if (typeof document.hidden isnt "undefined")
      return "visibilitychange"
    else if (typeof document.mozHidden isnt "undefined")
      return "mozvisibilitychange"
    else if (typeof document.msHidden isnt "undefined")
      return "msvisibilitychange"
    else if (typeof document.webkitHidden isnt "undefined")
      return "webkitvisibilitychange"

  toggleMenu: =>
    @body.toggleClass 'menu-active'

  resizedWindow: =>
    UmPorCento.EventDispatcher.trigger 'window:resized', {width: @$el.width(), height: @$el.height()}

  docScrolled: =>
    UmPorCento.EventDispatcher.trigger 'window:scrolled', @$el.scrollTop()

  changedVisibility: (e)=>
    UmPorCento.EventDispatcher.trigger 'window:visibilitychanged', e.target.visibilityState

class UmPorCento.Views.MainMenu extends Backbone.View
  el: '#main-menu'
  events: 'click .menu-toggl': 'clickedToggle'
  initialize: ->
    # UmPorCento.EventDispatcher.on 'window:resized', @windowResized

  clickedToggle: (ev)=>
    UmPorCento.EventDispatcher.trigger 'menu:toggle'
    false

class UmPorCento.Views.AnimatedSection extends Backbone.View
  initialize: ->
    UmPorCento.EventDispatcher.on 'window:resized', @newPosition
    @model.on 'change:animate', @render
    @model.set 'offset', @$el.data('offset') if @$el.data('offset')
    @newPosition()

  newPosition: =>
    @model.set 'activatePosition', @$el.offset().top

  render: =>
    if @model.get('animate') then @$el.addClass('animate') else @$el.removeClass('animate')

################################################################################
# TEMPORARY
################################################################################
class UmPorCento.Views.ConstructionAlert extends Backbone.View
  el: '#construction-alert'
  initialize: ->
    $('a[data-construction=true]').on 'click', @displayAlert

  displayAlert: =>
    @$el.clearQueue().slideDown().delay(4000).fadeOut()
    false