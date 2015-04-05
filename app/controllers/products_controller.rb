class ProductsController < ApplicationController
  def index
    @products = Product.page(params[:page]).per(8).order("id DESC")
  end

  def new
  end

  def create
    Product.create(title: create_params[:title], explanation: create_params[:explanation], price: create_params[:price], capacity: create_params[:capacity],avatar: create_params[:avatar], date: create_params[:date], start_time: create_params[:start_time], finish_time: create_params[:finish_time])
    redirect_to "/products"
  end

  def show
    @product = Product.find(params[:id])
  end

  private
  def create_params
    params.permit(:title, :explanation, :price, :capacity, :avatar, :date, :start_time, :finish_time)
  end

end
