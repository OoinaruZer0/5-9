Rails.application.routes.draw do


  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html


  root 'books#top'

  # post '/books' => 'books#create'

  resources :books
  resources :users, only: [:show, :edit, :update]

  get 'about' => 'books#about'

  get 'users' => 'users#users'

end
