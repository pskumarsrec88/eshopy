class OrdersController < ApplicationController
  before_action :set_order, only: [:show, :edit, :update, :destroy]
  before_action :set_product, only: [:edit, :new]

  # GET /orders
  def index
    @orders = Order.all.order(created_at: :desc)
  end

  # GET /orders/1
  def show
  end
  
  # GET /orders/1
  def edit
  end

  # GET /orders/new
  def new
    @order = Order.new
  end

  # POST /orders
  def create
    @cart = Cart.all
    @order = Order.create(value: @cart.sum(:value))
    @cart.each { |cart| @order.order_products.create(product_id: cart.product_id, quantity: cart.quantity, price: cart.price) }
    @cart.destroy_all
    respond_to do |format|
      format.html { redirect_to orders_path, notice: 'Order was successfully created.' }
    end
  end
  
  # PATCH/PUT /orders/1
  def update
    respond_to do |format|
      if @order.update(order_params)
        format.html { redirect_to orders_path, notice: 'Order was successfully updated.' }
      else
        format.html { render :edit }
      end
    end
  end

  # DELETE /orders/1
  def destroy
    @order.destroy
    respond_to do |format|
      format.html { redirect_to orders_url, notice: 'Order was successfully destroyed.' }
    end
  end

  private
    # Loading order
    def set_order
      @order = Order.where('id =?',params[:id]).first
    end
    
    def set_product
      @product = Product.where('id =?',params[:product_id]).first
    end
    
    def order_params
      params.require(:order).permit(:product_id, :quantity, :status)
    end
    
end
