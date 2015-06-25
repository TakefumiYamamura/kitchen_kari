class TopController < ApplicationController
  def index
    @products = Product.all.order("id DESC").limit(5)
    @cooks = User.where(user_type: [1,2]).limit(5) #enumで楽にできないかな？
    @places = Place.all
  end

  def show
    @product = Product.find(params[:id])
  end

  def callback
    # auth = request.env["omniauth.auth"]
    # user = User.find_by_provider_and_uid(auth["provider"],auth["uid"] || User.create_with_omniauth(auth))
    # session[:user_id]=user.id
    auth = request.env["omniauth.auth"]
    user = User.find_by(provider: auth["provider"], uid: auth["uid"]) || User.create_with_omniauth(auth)
    sign_in(:user, user)
    session[:user_id] = user.id
    redirect_to root_path, notice: 'ログインしました'
  end

end