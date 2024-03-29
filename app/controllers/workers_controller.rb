class WorkersController < ApplicationController
  before_action :set_worker, only: [:show, :edit, :update, :destroy ]

  # GET /workers or /workers.json
  def index
    @workers = Worker.all
    @workers = Worker.all.order("created_at ASC").paginate(page: params[:page], per_page: 5)
  end

  def search
      @workers = Worker.where("role LIKE ?", "%" + params[:q] + "%") 
   end

    def viewer
    @workers = Worker.all
    end


  # GET /workers/1 or /workers/1.json
  def show
    if @worker.reviews.blank?
      @average_review = 0
    else
      @average_review = @worker.reviews.average(:rating).round(2)
  end
end

  # GET /workers/new
  def new
    @worker = Worker.new
  end

  # GET /workers/1/edit
  def edit
  end

  # POST /workers or /workers.json
  def create
    @worker = Worker.new(worker_params)

    respond_to do |format|
      if @worker.save
        format.html { redirect_to @worker, notice: "Worker was successfully created." }
        format.json { render :show, status: :created, location: @worker }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @worker.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /workers/1 or /workers/1.json
  def update
    respond_to do |format|
      if @worker.update(worker_params)
        format.html { redirect_to @worker, notice: "Worker was successfully updated." }
        format.json { render :show, status: :ok, location: @worker }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @worker.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /workers/1 or /workers/1.json
  def destroy
    @worker.destroy
    respond_to do |format|
      format.html { redirect_to workers_url, notice: "Worker was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_worker
      @worker = Worker.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def worker_params
      params.require(:worker).permit(:image, :name, :email, :address, :role, :experience, :phone, :fixedamount ,:latitude ,:longitude)
    end
end
