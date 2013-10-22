class PagesController < ApplicationController
  
  def home
    @products = Shoppe::Product.active.featured.includes(:default_image, :product_category, :variants).root
  end
  
end

