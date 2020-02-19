class LikesController < ApplicationController
  # before_action  :set_product,  only: [:create, :destroy]

  def create
    like = Like.new(user_id: current_user.id, product_id: params[:product_id])
    if like.save
      redirect_to product_path(params[:product_id])
    else
      redirect_to product_path(params[:product_id])
    end
  end

  def destroy
    like = Like.find_by(user_id: current_user.id, product_id: params[:product_id])
    like.destroy
    redirect_to product_path(params[:product_id]) 
  end 
end
