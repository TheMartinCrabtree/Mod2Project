Rails.application.routes.draw do
  resources :playerencounters
  resources :encountermonsters
  resources :encounters
  resources :dungeonmasters
  resources :players
  resources :monsters

  root "dungeonmaster#index"
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
