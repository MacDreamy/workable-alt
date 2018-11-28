Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root to: 'devise/registrations#new'

  get '/workspaces', to: 'workspaces#all', as: :workspaces

  resources :users do
    resources :workspaces, shallow: true
  end
end
