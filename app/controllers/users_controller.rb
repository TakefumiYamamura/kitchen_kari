class UsersController < ApplicationController
  def show
    @user = current_user
    @books = Book.list_of_books(current_user)
    @self_books = Book.list_of_self_books(current_user)
  end

  def registration
    @user = current_user
  end

  def update
    current_user.update(add_params)
    redirect_to controller: :products, action: :new
  end

  private
  def add_params
    params.permit(:place_id, :avatar)
  end
end
