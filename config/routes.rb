Rails.application.routes.draw do
  root to: 'option_sets#new'

  resources :option_sets, only: [:create]
  get '/:id', to: 'option_sets#show', as: :option_set
end
