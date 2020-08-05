Rails.application.routes.draw do
  

  root to: 'gossips#index'

  resources :gossips #, except: [:destroy] 
  resources :users

  # resources :comments, only: [:new, :create, :index, :destroy]
  # Ancien gossîp
  #  get '/gossip/:id', to: 'gossips#show', as: 'show'
  # (liste des methodes : index, show, new, create, edit, update ou destroy)
  # get '/user/:id', to: 'users#show', as: 'user'


  get '/team', to: 'static#team'
  get '/contact', to: 'static#contact'
  get '/welcome/:name', to: 'static#welcome'

end
