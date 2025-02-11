# config/routes.rb
Rails.application.routes.draw do
  get "profiles/show"
  get "profiles/borrowed_books"
  get "books/index"
  get "books/show"

  # Health check route
  get "up" => "rails/health#show", as: :rails_health_check

  # Devise user authentication routes
  devise_for :users

  # Define root path (redirect to book listing page)
  root to: 'books#index'

  # Routes for Books
  resources :books, only: [:index, :show] do
    member do
      post 'borrow' # Borrow a book
      post 'return' # Return a book
    end
  end

  # Routes for User Profile
  resource :profile, only: [:show] do
    get 'borrowed_books' # Show borrowed books
  end
end
