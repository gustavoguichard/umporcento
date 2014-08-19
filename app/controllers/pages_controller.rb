class PagesController < ApplicationController
  # before_filter :load_resources

  def home
    @slides = [
      {url: "slides/slide-3.jpg", caption_1: "Que você andou", caption_2: "de bicicleta?", title: "Pessoal"},
      {url: "slides/slide-2.jpg", caption_1: "Que você abraçou", caption_2: "alguém de verdade?", title: "Interpessoal"},
      {url: "slides/slide-4.jpg", caption_1: "Que você brincou", caption_2: "com seus filhos?", title: "Familiar"},
      {url: "slides/slide-1.jpg", caption_1: "Que você se dedicou", caption_2: "a uma causa nobre?", title: "Social"}
    ]
    @comumCircle = [
      {title: "Somos um/uma", words: %w(marca símbolo movimento comunidade bandeira insígnia grupo nome ideia rede)},
      {title: "100%", words: %w(compartilhada open\ source autônoma gratuita livre aberta coletiva distribuída colaborativa auto-gestionada)},
      {title: "Que faz", words: %w(arte ações projetos negócios tecnologia comunicação encontros produtos serviços coisas)}
    ]
  end

  def about
  end

end
