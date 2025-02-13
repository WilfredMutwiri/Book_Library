Rails.application.routes.draw do
  get "profiles/show"
  get "profiles/borrowed_books"
  
  devise_for :users
  
  root to: 'books#index'

  resources :books, only: [:index, :show] do
    member do
      post 'borrow'
      post 'return', to: 'borrowings#return', as: :return_book # Ensures return_book_path(book) works
    end
  end

  resource :profile, only: [:show] do
    get 'borrowed_books' 
  end

  get "up" => "rails/health#show", as: :rails_health_check
end
