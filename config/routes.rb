Rails.application.routes.draw do
  root to: 'option_sets#new'

  resources :option_sets, only: [:create]
  get '/v/:id', to: 'option_sets#show', as: :option_set
end
