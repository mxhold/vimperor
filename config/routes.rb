Rails.application.routes.draw do
  root to: 'option_sets#new'

  resources :option_sets, only: [:create]
end
