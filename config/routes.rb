Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  root to: 'workspaces#all'

  resources :users do
    resources :workspaces, shallow: true do
      resources :reviews, shallow: true
    end
  end
end
