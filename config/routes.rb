Rails.application.routes.draw do
  devise_for :users, controllers: { registrations: "registrations" }
  root to: 'pages#home'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  resources :profiles, only: [:new, :create, :show, :edit, :update]
  resources :boardgames, only: [:index, :show, :create, :destroy]
  post 'boardgames/search', action: :search, controller: 'boardgames'

  resources :conversations do
    resources :messages
  end
end
