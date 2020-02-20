class UsersController < ApplicationController
  def index
    @users = User.all
  end
  
  def show
    @nickname = current_user.nickname
    @products = current_user.products.where(params[:description])
  end
end
