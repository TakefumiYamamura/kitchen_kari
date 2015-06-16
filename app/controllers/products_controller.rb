class ProductsController < ApplicationController

  before_action :authenticate_user!, only: [:new]
  before_action :configure_info, only: [:new]

  def configure_info
    redirect_to controller: :users, action: :registration unless  current_user.address.present? || current_user.tel.present? || current_user.area.present?
  end

  def index
    @products = Product.page(params[:page]).per(8).order("id DESC")
    if params[:area] == "" || params[:area] == nil
      @lat = 35.6640352
      @lng = 139.6982122
    else
      @lat = Geocoder.search(params[:area])[0].data["geometry"]["location"]["lat"]
      @lng = Geocoder.search(params[:area])[0].data["geometry"]["location"]["lng"]
    end
  end

  def new
  end

  def create
    Product.create(title: create_params[:title], explanation: create_params[:explanation], price: create_params[:price], capacity: create_params[:capacity],avatar: create_params[:avatar], date: create_params[:date], start_time: create_params[:start_time], finish_time: create_params[:finish_time], user_id: create_params[:user_id])
    redirect_to "/"
  end

  def show
    @product = Product.find(params[:id])
    @days = CooksSchedule.fetch_two_weeks(Date.today)
  end

  def search
    @products = User.by_area_products(area_params[:area])
  end

  def purchase
    require 'webpay'
    webpay = WebPay.new(WEBPAY_SECRET_KEY)
    webpay.charge.create(currency: 'jpy', amount: 1000, card: params['webpay-token'])
    # WebPay.api_key = WEBPAY_SECRET_KEY
    # WebPay::Charge.create(currency: 'jpy', amount: 1000, card: params['webpay-token'])
    Book.create(persons: create_params[:persons], book_time: create_params[:date], user_id: current_user.id, product_id: create_params[:product_id])
    # redirect_to "/products"
    redirect_to action: :purchased
  end

  def purchased
  end

  private
  def create_params
    params.permit(:title, :explanation, :price, :capacity, :avatar, :date, :start_time, :finish_time, :user_id, :persons, :book_time, :product_id)
  end

  def area_params
    params.permit(:area)
  end

end
