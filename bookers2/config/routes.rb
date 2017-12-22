Rails.application.routes.draw do


  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html


  root 'books#top'

  post '/books' => 'books#create'

  get '/books' => 'books#index'

  get '/books/:id' => 'books#show', as: 'book'

  get '/books/:id/edit' => 'books#edit', as: 'edit_book'

  patch '/books/:id' => 'books#update', as: 'update_book'

  delete '/books/:id' => 'books#destroy', as: 'destroy_book'

  resources :users, only: [:show, :edit, :update]

end
