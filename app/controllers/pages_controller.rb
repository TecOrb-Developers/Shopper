class PagesController < ApplicationController
  
  def home
    @products = Shoppe::Product.active.featured.includes(:default_image, :product_categories, :variants).root
  end
  
end

