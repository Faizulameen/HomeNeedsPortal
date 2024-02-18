class BuysController < ApplicationController
	before_action :find_order_item

	
	def new
		@buy = Buy.new
	end

	def create
		@buy = Buy.new(buy_params)
		@buy.order_item_id = @order_item.id
		@buy.user_id = current_user.id

      if @buy.save
      	redirect_to root_path
    
      else
   	 render 'new'
      end
    end
	
	private

	def buy_params
		params.require(:buy).permit(:address, :city, :state, :pin, :cardname, :cardno, :expmonth, :expyear, :cvv)
	end

	def find_order_item
		@order_item = Order_item.find(params[:order_item_id])
	end
	
end
