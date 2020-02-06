class ProductsController < ApplicationController
  before_action :user_admin, only: [:create, :update, :edit, :destroy]

  def index
    @products = Product.all
    @most_reviews = @products.most_reviews
    render :index
  end

  def new
    @product = Product.new
    render :new
  end

  def create
    @product = Product.new(product_params)
    if @product.save
      flash[:notice] = "Product successfully created."
      render :show
    else
      render :new
    end
  end

  def edit
    @product = Product.find(params[:id])
    render :edit
  end

  def show
    @product = Product.find(params[:id])
    @product.photos.attach(params[:photos])
    render :show
  end

  def update
    @product= Product.find(params[:id])
    if @product.update(product_params)
      redirect_to products_path
    else
      render :edit
    end
  end

  def destroy
    @product = Product.find(params[:id])
    @product.destroy
    flash[:notice] = "Product successfully deleted."
    redirect_to products_path
  end


  private
  def product_params
    params.require(:product).permit(:name, :cost, :country_of_origin, photos: [])
  end
end
