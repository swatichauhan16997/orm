# Controller for Orders
class OrdersController < ApplicationController
  # before_action :current_order
  protect_from_forgery except: :list_session_orders

  def new
    skip_authorization
    @order = Order.new
  end

  def create
    skip_authorization
    @master_order = MasterOrder.new
    OrderHandler.new(params, session).manage_order
    @orders = session_orders
    respond_to do |f|
      f.html { redirect_to root_path }
      f.js
    end
  end

  def remove
    skip_authorization
    @master_order = MasterOrder.new
    @order = Order.find(params[:order_id])
    qty = @order.quantity if @order
    if qty > 0
      qty -= 1
      @order.update_attributes(quantity: qty, price: qty * @order.food_item.price.to_i)
    else
      session[:order][@order.id.to_s] = nil
      @order.destroy
    end
    @orders = session_orders
  end

  def index
    authorize Order, :index?
    @orders = Order.all
  end

  def edit
    authorize Order, :edit?  
  end

  def show
    authorize Order, :show?
    @order = Order.find(params[:id])
  end

  def destroy
    skip_authorization
    @order = Order.find(params[:id])
    session[:order][@order.id.to_s] = nil
    @order.destroy
    @orders = session_orders
    respond_to do |f|
      f.html { redirect_to root_path }
      f.js
    end
  end

  def show_cart
    skip_authorization
    @master_order = MasterOrder.new # if !@master_order.nil?
    @orders = session_orders
    respond_to do |f|
      f.html { redirect_to root_path }
      f.js
    end
  end

  private

  def session_orders
    if !session[:order].nil?
      Order.where(id: session[:order].keys).includes(:food_item)
    else
      []
    end
  end

  def order_params
    params.require(:order).permit(:order_datetime, :quantity,
                                  :price, :food_item_id)
  end
end