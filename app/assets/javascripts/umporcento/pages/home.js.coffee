################################################################################
# MAIN JS THAT CONTROLS EACH PAGE
################################################################################
UmPorCento.Pages.Home = 
  init: ->
    new UmPorCento.Views.MainSlider
    for $animatedSection in $('.animated-section')
      model = new UmPorCento.Models.AnimatedSection
      new UmPorCento.Views.AnimatedSection {el: $animatedSection, model: model}