class ApplicationController < ActionController::Base
  def index
    @categories = Category.all
    @products = Product.all
  end

  def toastr_flash
    flash.each_with_object([]) do |(type, message), flash_messages|
      type = 'success' if type == 'notice'
      type = 'error' if type == 'alert' || type == 'danger'
      text = "<script>toastr.#{type}('#{message}');</script>"
      flash_messages << text.html_safe if message
    end.join("\n").html_safe
  end
  
end
