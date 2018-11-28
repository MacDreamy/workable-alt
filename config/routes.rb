Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  root to: 'pages#home'

  get '/workspaces', to: 'workspaces#all', as: :workspaces

  resources :users do
    resources :workspaces, shallow: true
  end
end
