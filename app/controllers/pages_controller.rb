class PagesController < ApplicationController
  
  def home
    @products = Shoppe::Product.active.featured.includes(:product_categories, :variants).root
  end
  
end

