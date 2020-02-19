class ProductsController < ApplicationController

  before_action :move_to_index, except: :index

  def index
    @products = Product.all
  end

  def new
    @product = Product.new
  end

  def create
    product = Product.new(name: product_params[:name], description: product_params[:description], user_id: current_user.id, image: product_params[:image])
    if product.save
        redirect_to products_path,notice: "「#{product.name}」登録しました"
    else
      render :new
    end
  end

  def show
    @product = Product.find(params[:id])
    @like_count = Like.where(product_id: params[:product_id]).count
  end

  def edit
    @product = Product.find(params[:id])
  end

  def update
    product = Product.find(params[:id])
    product.image.detach
    if product.update(product_params)
        redirect_to products_path,notice: "「#{product.name}」更新しました"
    else
        render :edit
    end
  end

  def destroy
    product = Product.find(params[:id])
    product.destroy
    redirect_to products_path,notice: "「#{product.name}」削除しました"
  end

  private

  def product_params
    params.require(:product).permit(:name,:description,:image)
  end

  def move_to_index
    redirect_to action: :index  unless user_signed_in?
  end
  
end
