################################################################################
# MAIN JS THAT CONTROLS EACH PAGE
################################################################################
UmPorCento.Pages.Home = 
  init: ->
    new UmPorCento.Views.MainSlider
    new UmPorCento.Views.ConstructionAlert
    for $animatedSection in $('.animated-section')
      new UmPorCento.Views.AnimatedSection {el: $animatedSection}
    new UmPorCento.Views.ConstructionAlert