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
    $('.main-content').on 'click', @closeMenu
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
    @height = @$el.height()
    @width = @$el.width()
    UmPorCento.EventDispatcher.trigger 'window:resized', {width: @width, height: @height}

  docScrolled: =>
    UmPorCento.EventDispatcher.trigger 'window:scrolled', @lastPixel()

  lastPixel: =>
    @$el.scrollTop() + @height

  changedVisibility: (event)=>
    UmPorCento.EventDispatcher.trigger 'window:visibilitychanged', event.target.visibilityState

  closeMenu: =>
    UmPorCento.EventDispatcher.trigger 'menu:toggle' if @body.hasClass('menu-active')

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
    UmPorCento.EventDispatcher.on 'window:resized', @newWindowSize
    @model.on 'change:animate', @render
    @model.set 'offset', @$el.data('offset') if @$el.data('offset')

  newWindowSize: (size)=>
    @model.set 'activatePosition', @$el.offset().top
    if @$el.data('offset-mobile')? and size.width <= 768
      @model.set 'offset', @$el.data('offset-mobile')
    else
      @model.set 'offset', @$el.data('offset') if @$el.data('offset')

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