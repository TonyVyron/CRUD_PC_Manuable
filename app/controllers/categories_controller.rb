class CategoriesController < ApplicationController
  def index
    @categories = Category.all
  end

  def show
    @category = Category.find(params[:id])
  end

  def new
    @category = Category.new
  end

  def create
    @category = Category.new(category_params)
    if @category.save
      redirect_to categories_path, notice: 'Category was successfully created'
    else
      flash.now[:alert] = 'Failed to create Category. Please check the errors and try again.'
      render :new
    end
  end

  def edit
    @category = Category.find(params[:id])
  end

  def update
    @category = Category.find(params[:id])
    if @category.update(category_params)
      redirect_to @category
    else
      flash.now[:alert] = 'Failed to update Category. Please check the errors and try again.'
      render :edit
    end
  end

  def destroy
    @category = Category.find(params[:id])
    if @category.destroy
      redirect_to categories_path, notice: 'Category deleted successfully'
    end
  rescue StandardError => e
    redirect_to categories_path, alert: "Failed to delete category. It might be in use or another error occurred"
  end

  private

  def category_params
    params.require(:category).permit(:name)
  end
end