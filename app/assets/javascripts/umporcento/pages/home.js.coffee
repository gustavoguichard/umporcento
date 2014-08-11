################################################################################
# MAIN JS THAT CONTROLS EACH PAGE
################################################################################
UmPorCento.Pages.Home = 
  init: ->
    new UmPorCento.Views.MainSlider
    for $animatedSection in $('.animated-section')
      new UmPorCento.Views.AnimatedSection {el: $animatedSection}