class UsersController < ApplicationController
  def show
    @books = Book.list_of_books(current_user)
    @self_books = Book.list_of_self_books(current_user)
  end
end
