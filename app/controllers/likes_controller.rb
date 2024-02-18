class LikesController < ApplicationController

	def create
		@like = current_user.likes.new(like_params)
		if !@like.save
			flash[:notice] = @like.errors.full_messages.to_sentence
	end
	redirect_to shops_path
	end

	def destroy
		@like = current_user.likes.find(params[:id])
		product = @like.product
		@like.destroy
		redirect_to shops_path
	end

	private
	def like_params
		params.require(:like).permit(:product_id)
	end

end
