Rails.application.routes.draw do
  

  root to: 'gossips#home'
  get '/team', to: 'static#team'
  get '/contact', to: 'static#contact'
  get '/welcome/:name', to: 'static#welcome'

  get '/gossip/:id', to: 'gossips#show', as: 'show'

  get '/user/:id', to: 'users#show', as: 'user'

  # get 'gossips/new' ... plus tard...

end
