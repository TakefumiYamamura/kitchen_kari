class UsersController < ApplicationController
  def show
    @user = current_user
    @books = Book.list_of_books(current_user)
    @self_books = Book.list_of_self_books(current_user)
  end

  def registration
  end

  def update
    current_user.update(address: add_params[:address], tel: add_params[:tel], area: add_params[:area])
    redirect_to controller: :products, action: :new
  end

  private
  def add_params
    params.permit(:address, :tel, :area)
  end
end
