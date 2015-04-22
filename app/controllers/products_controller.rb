class ProductsController < ApplicationController
  
  before_action :set_product, only: [:edit, :update, :destroy]

  # GET /products
  def index
    @products = Product.active.order(created_at: :desc)
  end

  # GET /products/1
  def show
    redirect_to products_path, notice: "You don't have access for this page"
  end

  # GET /products/new
  def new
    @product = Product.new
  end

  # GET /products/1/edit
  def edit
  end

  # POST /products
  def create
    @product = Product.new(product_params)

    respond_to do |format|
      if @product.save
        format.html { redirect_to products_path, notice: 'Product was successfully created.' }
      else
        format.html { render :new }
      end
    end
  end

  # PATCH/PUT /products/1
  def update
    respond_to do |format|
      if @product.update(product_params)
        format.html { redirect_to products_path, notice: 'Product was successfully updated.' }
      else
        format.html { render :edit }
      end
    end
  end

  # DELETE /products/1
  def destroy
    @product.update(:active => false)
    respond_to do |format|
      format.html { redirect_to products_url, notice: 'Product was successfully destroyed.' }
     end
  end

  private
    # Loading product
    def set_product
      @product = Product.where('id =?',params[:id]).first
    end

    # Strong parameters.
    def product_params
      params.require(:product).permit(:title, :description, :price)
    end
end
