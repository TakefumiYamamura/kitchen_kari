class TopController < ApplicationController
  def index
    @products = Product.all.order("id DESC").limit(5)
  end

  def show
    @product = Product.find(params[:id])
  end
end
