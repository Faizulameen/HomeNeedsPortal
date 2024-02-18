class BlocksController < ApplicationController
	before_action :find_worker
	before_action :find_block, only: [:edit, :update, :destroy]

	def index
		@block = Block.all
	end
	
	def new
		@block = Block.new
	end

	def create
		@block = Block.new(block_params)
		@block.worker_id = @worker.id
		@block.user_id = current_user.id

		respond_to do |format|
      if @block.save
        format.html { redirect_to bookings_path([@worker]), notice: 'Book and payment was successfully done.' }
        format.json { render :show, status: :created, location: @worker }
      else
        format.html { render :new }
        format.json { render json: @worker.errors, status: :unprocessable_entity }
      end
  end
    end

	def edit
	end

	def update

		if @block.update(block_params)
			redirect_to viewer_path(@worker)
		else
			render 'edit'
		end
	end

	def destroy
		@block.destroy
		redirect_to viewer_path(@worker)
	end

	private

	def block_params
		params.require(:block).permit(:from, :to, :address, :city, :state, :pin, :cardname, :cardno, :expmonth, :expyear, :cvv, :status)
	end

	def find_worker
		@worker = Worker.find(params[:worker_id])
	end


	def find_block
		@block = Block.find(params[:id])
	end
end
