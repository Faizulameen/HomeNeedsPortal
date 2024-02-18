class ReviewsController < ApplicationController
	before_action :find_worker
	before_action :find_review, only: [:edit, :update, :destroy]
	def new
		@review = Review.new
	end

	def create
		@review = Review.new(review_params)
		@review.worker_id = @worker.id
		@review.user_id = current_user.id


		if @review.save
			redirect_to worker_path(@worker)
		else
			render 'new'
		end
	end

	def edit
	end

	def update

		if @review.update(review_params)
			redirect_to worker_path(@worker)
		else
			render 'edit'
		end
	end

	def destroy
		@review.destroy
		redirect_to worker_path(@worker)
	end

	private

	def review_params
		params.require(:review).permit(:rating, :comment)
	end

	def find_worker
		@worker = Worker.find(params[:worker_id])
	end

	def find_review
		@review = Review.find(params[:id])
	end
end
