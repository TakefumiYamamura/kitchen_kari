class TopController < ApplicationController
  def index
    @products = Product.all.order("id DESC").limit(5)
    @cooks = User.where(user_type: [1,2]).limit(5) #enumで楽にできないかな？
  end

  def show
    @product = Product.find(params[:id])
  end
end