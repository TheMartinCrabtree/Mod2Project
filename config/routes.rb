Rails.application.routes.draw do
  resources :playerencounters
  resources :encountermonsters
  resources :dungeonmasters
  resources :players
  resources :monsters
  resources :encounters do 
    member do
    get 'fight'
  end
end


  get '/encounters/:id/fight', to: 'encounter#edit', as: "encounter_fight"
  get '/welcome', to: 'login#new'
  post '/login', to: 'login#create'

  root "login#new"
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
