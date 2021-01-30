Rails.application.routes.draw do

  # get 'sessions/create'
  post 'login', to: 'sessions#create'

  # get 'sessions/destroy'
  delete 'logout', to: 'sessions#destroy'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  # get 'boards', to: 'boards#index'
  # post 'boards', to: 'boards#create'
  # get 'boards/new', to: 'boards#new'
  # get 'boards/:id', to: 'boards#show'
  
  #resources :boards, only: [:index, :new, :create, :show, :edit, :update, :destroy]

  root 'home#index'

  # get 'users/me'
  get 'mypage', to: 'users#me'

  # get 'users/new'
  # get 'users/create'
  resources :users, only: %i[new create]

  resources :boards
  resources :comments, only: %i[create destroy]
end
