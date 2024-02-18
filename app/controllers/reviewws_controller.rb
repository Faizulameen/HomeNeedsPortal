class ReviewwsController < ApplicationController
	before_action :find_product
	before_action :find_revieww, only: [:edit, :update, :destroy]
	def new
		@revieww = Revieww.new
	end

	def create
		@revieww = Revieww.new(revieww_params)
		@revieww.product_id = @product.id
		@revieww.user_id = current_user.id


		if @revieww.save
			redirect_to shop_path(@product)
		else
			render 'new'
		end
	end

	def edit
	end

	def update

		if @revieww.update(revieww_params)
			redirect_to shop_path(@product)
		else
			render 'edit'
		end
	end

	def destroy
		@revieww.destroy
		redirect_to shop_path(@product)
	end

	private

	def revieww_params
		params.require(:revieww).permit(:rating, :comment)
	end

	def find_product
		@product = Product.find(params[:product_id])
	end

	def find_revieww
		@revieww = Revieww.find(params[:id])
	end
end