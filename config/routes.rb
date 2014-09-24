Rails.application.routes.draw do
  root to: 'option_sets#new'

  resources :option_sets, only: [:create]
  get '/:hashid', to: 'option_sets#show', as: :option_set
  get '/:hashid/download', to: 'option_sets#download', as: :download_option_set
end
