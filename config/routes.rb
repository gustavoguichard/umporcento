UmPorCento::Application.routes.draw do
  root 'pages#home'
  get '/about', to: 'pages#about'
  get '/quem-somos', to: 'pages#about', as: :quem_somos
end
