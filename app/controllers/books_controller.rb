class BooksController < ApplicationController
  def create
    book = Book.new(persons: create_params[:persons], date: create_params[:date], user_id: current_user.id, product_id: create_params[:product_id], start_time: create_params[:start_time])
    book.save
    dinners = User.find(current_user.id)
    cooks = Product.find(create_params[:product_id]).user
    dinners_mail = NoticeMailer.dinners_confirm(current_user, cooks, book)
    dinners_mail.deliver!
    cooks_mail = NoticeMailer.cooks_confirm(cooks, current_user, book)
    cooks_mail.deliver!
    @user = current_user
    @books = Book.list_of_books(current_user)
    @self_books = Book.list_of_self_books(current_user)
    redirect_to user_path(current_user.id)
  end

  def confirm
    @product_id, @day, @start_time = params[:product_id], params[:date], params[:start_time].to_i
  end

  private
  def create_params
    params.permit(:persons, :date, :user_id, :product_id, :start_time)
  end

end
