class OrdersController < ApplicationController
  #before_action :get_product
  before_action :set_order, only: %i[ show edit update destroy ]

  # GET /orders or /orders.json
  def index
    @orders = Order.all #@product.orders
  end

  # GET /orders/1 or /orders/1.json
  def show
    @order_details = @order.product_order_details
  end

  # GET /orders/new
  def new
    @order = Order.new
    @order.product_order_details.build
    @products = Product.all
    @sites = Site.all
  end

  # GET /orders/1/edit
  def edit
    @products = Product.all
    @sites = Site.all
  end

  # POST /orders or /orders.json
  def create
    @order = Order.new(order_params)
    @order.user_id = current_user.id

    respond_to do |format|
      if @order.save
        format.html { redirect_to order_path(@order), notice: "Order was successfully created." }
        format.json { render :show, status: :created, location: @order }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @order.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /orders/1 or /orders/1.json
  def update
    respond_to do |format|
      if @order.update(order_params)
        format.html { redirect_to order_path(@order), notice: "Order was successfully updated." }
        format.json { render :show, status: :ok, location: @order }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @order.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /orders/1 or /orders/1.json
  def destroy
    @order.destroy

    respond_to do |format|
      format.html { redirect_to orders_path, notice: "Order was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  def add_new
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_order
      @order = Order.find(params[:id])
    end

    def get_product
      @product = Product.find(params[:product_id])
    end

    # Only allow a list of trusted parameters through.
    def order_params
      params.require(:order).permit(
        :site_id,
        :user_id, 
        product_order_details_attributes: [:product_id, :quantity, :special_instructions]
      )
    end

    def product_order_params
      params[:order]
    end
end
