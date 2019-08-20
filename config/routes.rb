Rails.application.routes.draw do
  resources :encountermonsters
  resources :encounters
  resources :dungeonmasters
  resources :players
  resources :monsters

  get '/welcome', to: 'login#new'
  post '/login', to: 'login#create'

  root "dungeonmaster#index"
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
