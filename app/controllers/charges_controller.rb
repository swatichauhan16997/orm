# Charges Controller
class ChargesController < ApplicationController
  def new
    authorize MasterOrder, :index?
  end

  def create
    ActiveRecord::Base.transaction do
      authorize MasterOrder, :index?
      sum = 0
      session[:order].keys.each do |order|
        o= Order.find(order)
        sum = sum + o.price
      end
      @amount = (sum.to_i)*100
      @orders = Order.find(session[:order].compact.keys)
      @restaurants = Restaurant.find(@orders.pluck(:restaurant_id).uniq)
      @admins = {}
      @restaurants.each do |r|
        price = Order.where(restaurant_id: r.id, id: session[:order].compact.keys).map{ |o| o.price }.sum.to_i
        @admins[r.user.account_id] = price

      end
      error_message = ChargesHandler.new(params, @amount,@admins).manage_charges
      order_types = MasterOrder.order_types.keys
      payment_types = MasterOrder.payment_types.keys
      params[:master_order] = {}
      params[:master_order][:order_type] = params[:o_type]
      params[:master_order][:payment_type] = params[:p_type]

      @restaurants.each do |r|
        @m = MasterOrderHandler.new(params, session, current_user, r.id).manage_master_order
      end
      if @m.order_type == 'pickup' && @m.payment_type == 'card'
        @m.update_attributes(order_status: 'ready', payment_status: 'paid')

      elsif @m.order_type == 'home delivery' && @m.payment_type == 'card'
        @m.update_attribute(:payment_status, 'paid')
      end
      redirect_path = if @m.order_type == 'home delivery'
                        new_home_delivery_path(master_order: @m)
                      else  static_pages_my_account_path
                      end
    end
    if @m.order_type == 'home delivery'
      redirect_to new_home_delivery_path(master_order: @m)
    else
      redirect_to static_pages_my_account_path
    end
   # if current_user.has_role? 'customer'
    #  error_message.nil? ? (redirect_to master_orders_path) : (redirect_to new_charge_path)
    #else
     # error_message.nil? ? (redirect_to  my_orders_master_orders_path ) : (redirect_to new_charge_path)


  end

  def get_account
    data = {client_secret: "sk_test_yK8JeCfpwfzeaMyUU5krUOXo", code: params[:code], grant_type: "authorization_code"}
    x = Net::HTTP.post_form(URI.parse('https://connect.stripe.com/oauth/token'), data)
    current_user.update_attributes(account_id:  JSON.parse(x.body)["stripe_user_id"])
    redirect_to root_path
  end

  def master_order_params
    params.permit(:total, :order_type, :payment_type,
                                         :order_status, :payment_status,
                                         :transaction_id, :user_id)
  end

end
