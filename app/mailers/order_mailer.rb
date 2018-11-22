# Mailer class for Order module
class OrderMailer < ApplicationMailer
  def order_placed(user_id, master_order_id)
    @user_id = user_id
    @master_order_id = master_order_id
    mail to: [@user.email], subject: 'Order placed.'
  end

  def cancel_order(user_id, master_order_id)
    @user_id = user_id
    @master_order_id = master_order_id
    mail to: [@user.email], subject: 'Order cancelled.'
  end
end
