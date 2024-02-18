class PaymentsController < ApplicationController
	before_action :find_product
	before_action :find_payment, only: [:edit, :update, :destroy]

	def index
		@payment = Payment.all
	end
	
	def new
		@payment = Payment.new
	end

	def create
		@payment = Payment.new(payment_params)
		@payment.product_id = @product.id
		@payment.user_id = current_user.id

		respond_to do |format|
      if @payment.save
        format.html { redirect_to root_path, notice: 'Payment was successfully done.' }
        format.json { render :show, status: :created, location: @shop }
      else
        format.html { render :new }
        format.json { render json: @shop.errors, status: :unprocessable_entity }
      end
    end
    
	end
	def edit
	end

	def update

		if @payment.update(payment_params)
			redirect_to view_path(@product)
		else
			render 'edit'
		end
	end

	def destroy
		@payment.destroy
		redirect_to view_path(@product)
	end

	private

	def payment_params
		params.require(:payment).permit(:address, :city, :state, :pin, :cardname, :cardno, :expmonth, :expyear, :cvv, :status)
	end

	def find_product
		@product = Product.find(params[:product_id])
	end



	def find_payment
		@payment = Payment.find(params[:id])
	end
	

end
