class ProductsController < ApplicationController

  before_action :configure_info, only: [:new]

  def configure_info
    redirect_to controller: :users, action: :registration unless current_user.address.present? || current_user.tel.present? || current_user.area.present?
  end

  def index
    @products = Product.page(params[:page]).per(8).order("id DESC")
  end

  def new
  end

  def create
    Product.create(title: create_params[:title], explanation: create_params[:explanation], price: create_params[:price], capacity: create_params[:capacity],avatar: create_params[:avatar], date: create_params[:date], start_time: create_params[:start_time], finish_time: create_params[:finish_time], user_id: create_params[:user_id])
    redirect_to "/products"
  end

  def show
    @product = Product.find(params[:id])
  end

  def search
    @products = User.by_area_products(area_params[:area])
  end

  private
  def create_params
    params.permit(:title, :explanation, :price, :capacity, :avatar, :date, :start_time, :finish_time, :user_id)
  end

  def area_params
    params.permit(:area)
  end

end
