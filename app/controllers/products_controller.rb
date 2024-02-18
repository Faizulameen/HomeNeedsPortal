class ProductsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_product, only: [:show, :edit, :update, :destroy]

  # GET /products
  # GET /products.json
  def index
    @categories = Category.all

    cate = params[:cate]

    if !cate.nil?
      @products = Product.where(:category_id => cate)
    else
      @products = Product.all
    end
 
      
    # @products = Product.all.order("created_at ASC").paginate(page: params[:page], per_page: 10)
  end
  def searc
      @products = Product.where("title LIKE ?", "%" + params[:q] + "%") 
   end

   def view
    @products = Product.all
    @order = current_order

    end

    def contact
    end

    def alluser
      @users = User.all
      @online_users = User.where("last_seen_at > ?", 1.minutes.ago)
    end

  # GET /products/1
  # GET /products/1.json
  def show
    @products = Product.find(params[:id])
     if @product.reviewws.blank?
      @average_revieww = 0
    else
      @average_revieww = @product.reviewws.average(:rating).round(2)
  end
end

  # GET /products/new
  def new
    @product = Product.new
  end

  # GET /products/1/edit
  def edit
  end

  # POST /products
  # POST /products.json
  def create

    @product = Product.new(product_params)

    respond_to do |format|
      if @product.save
        format.html { redirect_to @product, notice: 'Product was successfully created.' }
        format.json { render :show, status: :created, location: @product }
      else
        format.html { render :new }
        format.json { render json: @product.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /products/1
  # PATCH/PUT /products/1.json
  def update
    @products = Product.find(params[:id])
    respond_to do |format|
      if @product.update(product_params)
        format.html { redirect_to @product, notice: 'Product was successfully updated.' }
        format.json { render :show, status: :ok, location: @product }
      else
        format.html { render :edit }
        format.json { render json: @product.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /products/1
  # DELETE /products/1.json
  def destroy
     @products = Product.find(params[:id])
    @product.destroy
    respond_to do |format|
      format.html { redirect_to products_url, notice: 'Product was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_product
      @product = Product.find(params[:id])
    end

    
    # Never trust parameters from the scary internet, only allow the white list through.
    def product_params
      params.require(:product).permit(:title, :price, :image, :category_id, assignments_attributes: [:id, :quantity, :color_id])
    end
end
