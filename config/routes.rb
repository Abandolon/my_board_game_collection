Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  resources :profiles, only: [:new, :create, :show]
  resources :boardgames, only: [:index, :show, :create, :destroy]
  post 'boardgames/search', action: :search, controller: 'boardgames'
end
