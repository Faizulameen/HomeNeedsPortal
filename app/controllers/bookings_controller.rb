class BookingsController < ApplicationController
	before_action :authenticate_user!
	
  def index
    @workers = Worker.all
    @workers = Worker.all.order("created_at ASC").paginate(page: params[:page], per_page: 5)
 
  end

  def show
    @workers = Worker.find(params[:id])
end
end


