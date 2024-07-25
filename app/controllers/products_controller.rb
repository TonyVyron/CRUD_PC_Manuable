class ProductsController < ApplicationController
 def index
    @products = Product.all
  end

  def show
    @product = Product.find(params[:id])
  end

  def new
    @product = Product.new
  end

  def create
    @product = Product.new(product_params)
    if @product.save
      redirect_to products_path, notice: 'Product was successfully created.'
    else
      flash.now[:alert] = 'Failed to create product. Please check the errors and try again.'
      render :new
    end
  end

  def edit
    @product = Product.find(params[:id])
  end

  def update
    @product = Product.find(params[:id])

    if params[:product][:remove_image] == '1'
      @product.image.purge
    end
    if @product.update(product_params)
      redirect_to @product, notice: 'Product was successfully updated.'
    else
      flash.now[:alert] = 'Failed to update Product. Please check the errors and try again.'
      render :edit
    end
  end

  def destroy
    @product = Product.find(params[:id])
    if @product.destroy
      redirect_to products_path, notice: 'Product was successfully deleted'
    end
  rescue StandardError => e
    redirect_to products_path, alert: "Failed to delete Product. It might be in use or another error occurred"
  end

  private

  def product_params
    params.require(:product).permit(:name, :price, :sku, :is_seasonal, :image, :quantity, :category_id, :unit)
  end
end
