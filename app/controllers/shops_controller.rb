class ShopsController < ApplicationController
before_action :authenticate_user!
	
  def index
    @categories = Category.all

    cate = params[:cate]

    if !cate.nil?
      @product = Product.where(:category_id => cate)
    else
      @products = Product.all
    end
    @products = Product.all.order("created_at ASC").paginate(page: params[:page], per_page: 6)
    
    @order_item = current_order.order_items.new

  end
  

  def show
    @product = Product.find(params[:id])
     if @product.reviewws.blank?
      @average_revieww = 0
    else
      @average_revieww = @product.reviewws.average(:rating).round(2)
  end
  end
end
