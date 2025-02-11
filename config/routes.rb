# config/routes.rb
Rails.application.routes.draw do
  get "profiles/show"
  get "profiles/borrowed_books"
  get "books/index"
  get "books/show"

  get "up" => "rails/health#show", as: :rails_health_check

  devise_for :users
  root to: 'books#index'
  resources :books, only: [:index, :show] do
    member do
      post 'borrow'
      post 'return'
    end
  end
  resource :profile, only: [:show] do
    get 'borrowed_books' 
  end

  resources :books, only: [:show] do
    resource :borrowing, only: [:create]
  end

  resources :borrowings, only: [] do
    member do
      post :return
    end
  end
end
