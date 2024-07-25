class ApplicationController < ActionController::Base
  def index
    @categories = Category.all
    @products = Product.all
  end
end
