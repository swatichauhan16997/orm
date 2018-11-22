# service for charges controller
class ChargesHandler
  attr_accessor :params
  def initialize(params, amount, admins)
    @params = params
    @amount = amount
    @admins = admins
  end

  def manage_charges
    customer_create
    charges_create
    transfer_create
    order_crete
    error_handle
  end

  private

  def customer_create
    @customer = Stripe::Customer.create(
      email: params[:stripeEmail],
      source: params[:stripeToken],
      description: "Customer On Foodle"
    )
  end

  def charges_create
    charge = Stripe::Charge.create(
      customer:    @customer.id,
      amount:      @amount,
      description: 'Rails Stripe customer',
      currency:    'usd'
    )
    
  end

  def transfer_create
    total_persons = @admins.count + 1
    transfer_amount = @amount/total_persons
    @commission =  CommissionSetting.first.commission_percentage.to_i
    @admins.each do |key, value|
      Stripe::Transfer.create(
        :amount => value * (100- @commission),
        :currency => "usd",
        :destination => key
      )
    end

  end
  def error_handle
  rescue Stripe::CardError => e
    flash[:error] = e.message
    'new_charge_path'
  end

  def order_crete
   # @order = MasterOrder.find(params[:m_id])
    #@order.payment_status = 'paid'
    #if @order.order_type == 'pickup'
     # @order.order_status = 'completed'
    #end
    #@order.save
  end



end
