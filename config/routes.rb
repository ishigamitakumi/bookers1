Rails.application.routes.draw do
  #get 'books' => 'books#index'
  #get 'books/edit'
  #post 'books' => 'books#create'
  root to: 'homes#top'
  #get 'books/:id' => 'books#show'
  resources :books
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
   patch 'books/:id' => 'books#update', as: 'update_book'
end