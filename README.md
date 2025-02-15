Book Library Application

This is a simple book lending library application built with Ruby on Rails. It allows users to borrow and return books while tracking due dates.

Features

User authentication (Devise)

Book borrowing and returning functionality

Due date tracking for borrowed books

User profile with a list of borrowed books

Requirements

Ensure you have the following installed:

Ruby 3.x

Rails 8.x

PostgreSQL (or SQLite for development)

Node.js & Yarn (for asset management)

Setup Instructions

1. Clone the repository
https://github.com/WilfredMutwiri/Book_Library.git
cd book-library

2. Install dependencies

bundle install
yarn install

3. Set up the database

rails db:create
rails db:migrate
rails db:seed # Optional: Seeds initial data

4. Start the server

rails server

Visit http://localhost:3000 to access the application.

Running Tests

The application uses Rails' default testing framework.

To run tests, use:

    rails test

API Endpoints

POST

/books/:book_id/borrow - to Borrow a book

POST

/books/:book_id/return - to Return a borrowed book

Deployment

To deploy the application, ensure you have a production database set up, then run:

rails assets:precompile
rails db:migrate RAILS_ENV=production

Then start your server with:

rails server -e production

License

This project is open-source and available under the MIT License.

Contributors

Wilfred Mutwiri - https://github.com/WilfredMutwiri

