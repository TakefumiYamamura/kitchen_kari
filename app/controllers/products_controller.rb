class ProductsController < ApplicationController
  def index
    @products = Product.page(params[:page]).per(8)
  end

  def new
  end

  def create
    Product.create(title: create_params[:title], explanation: create_params[:explanation], price: create_params[:price], capacity: create_params[:capacity],avatar: create_params[:avatar], date: create_params[:date])
    redirect_to "/products"
  end

  def show
    @product = Product.find(params[:id])
  end

  private
  def create_params
    params.permit(:title, :explanation, :price, :capacity, :avatar, :date)
  end

end
