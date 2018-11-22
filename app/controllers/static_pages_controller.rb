# Controller for Static Pages
class StaticPagesController < ApplicationController
  layout 'admin_panel', except: [:home, :about, :index, :contact]
  def home
    # @restaurant = Restaurant.find(params[:id])
    skip_authorization
    @restaurants = Restaurant.all.includes(:address, :offers).sample(3)
  end

  def about 
    skip_authorization
  end

  def my_account
    if current_delivery_boy.present?
      skip_authorization
    else
  	  authorize Category, :update?
    end
  end
end
