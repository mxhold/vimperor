Rails.application.routes.draw do
  root to: 'option_sets#new'

  resources :option_sets, only: [:create]
  get '/:hashid', to: 'option_sets#show', as: :option_set
end
