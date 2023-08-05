Rails.application.routes.draw do
  resources :followers
  get 'profiles/show'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"

  resources :blogs, only: [:index]
  resources :details, only: [:index]
  resources :users, only: [:index]

  resources :registrations
  post '/users/:id/follow', to: "registrations#follow", as: "follow_user"
  post '/users/:id/unfollow', to: "registrations#unfollow", as: "unfollow_user"
  
  root 'welcome#index'
  get 'sign_up', to: 'registrations#new'
  post 'sign_up', to: 'registrations#create'
  get 'sign_in', to: 'sessions#new'
  post 'sign_in', to: 'sessions#create', as: 'log_in'
  delete 'logout', to: 'sessions#destroy'
  get 'profile', to: 'profiles#show'
end
