class BooksController < ApplicationController
  def create
    Book.create(persons: create_params[:persons], book_time: create_params[:book_time], user_id: create_params[:user_id], product_id: create_params[:product_id])
    redirect_to "/products"
  end

  private
  def create_params
    params.permit(:persons, :book_time, :user_id, :product_id)
  end

end
