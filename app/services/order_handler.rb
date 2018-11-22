# Service for handling Orders
class OrderHandler
  attr_accessor :params

  def initialize(params, session)
    @params = params
    @session = session
  end

  def manage_order
    @food = FoodItem.find(@params[:food_item])
    @restaurant = Restaurant.find(@params[:restaurant_id])
    @session[:order] = {} if @session[:order].blank?
    Order.where(food_item_id: @food.id).count != 0 ? update_order : create_order
    set_session
  end

  private

  def update_order
    @order = Order.where(food_item_id: @food.id).last
    qty = @session[:order].compact.include?(@order.id.to_s) ? @order.quantity + 1 : 1
    @order.update_attributes(quantity: qty, price: qty * @food.final_price.to_i)
  end

  def create_order
    @order = Order.create(
      order_datetime: Time.now,
      price: @food.final_price.to_i,
      food_item_id: @food.id,
      quantity: 1,
      restaurant_id: @restaurant.id
    )
  end

  def set_session
    @session[:order][@order.id] = {
      order_id: @order.id,
      quantity: @order.quantity,
      price: @order.price.to_i
    }
  end
end
