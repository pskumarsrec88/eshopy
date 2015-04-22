class OrdersController < ApplicationController
  before_action :set_order, only: [:edit, :update, :destroy]
  before_action :set_product, only: [:edit, :new]

  # GET /orders
  def index
    @orders = Order.all
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
    @order = Order.new(order_params)
    respond_to do |format|
      if @order.save
        format.html { redirect_to orders_path, notice: 'Order was successfully created.' }
      else
        format.html { render :new }
      end
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
