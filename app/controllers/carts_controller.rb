class CartsController < ApplicationController
  before_action :set_cart, only: [:edit, :update, :destroy]
  before_action :set_product, only: [:edit, :new]

  # GET /carts
  def index
    @carts = Cart.all.order(created_at: :desc)
  end

  # GET /carts/1
  def show
  end
  
  # GET /carts/1
  def edit
  end

  # GET /carts/new
  def new
    @cart = Cart.new
  end

  # POST /carts
  def create
    @cart = Cart.new(cart_params)
    respond_to do |format|
      if @cart.save
        format.html { redirect_to carts_path, notice: 'Cart was successfully created.' }
      else
        format.html { render :new }
      end
    end
  end
  
  # PATCH/PUT /carts/1
  def update
    respond_to do |format|
      if @cart.update(cart_params)
        format.html { redirect_to carts_path, notice: 'Cart was successfully updated.' }
      else
        format.html { render :edit }
      end
    end
  end

  # DELETE /carts/1
  def destroy
    @cart.destroy
    respond_to do |format|
      format.html { redirect_to carts_url, notice: 'Cart was successfully destroyed.' }
    end
  end

  private
    # Loading cart
    def set_cart
      @cart = Cart.where('id =?',params[:id]).first
    end
    
    def set_product
      @product = Product.where('id =?',params[:product_id]).first
    end
    
    def cart_params
      params.require(:cart).permit(:product_id, :quantity, :status)
    end
    
end
