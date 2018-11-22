class CommissionSettingsController < ApplicationController
  def new
    @commission = CommissionSetting.new
  end
  def create
    @commission = CommissionSetting.new(commission_settings_params)
    if @commission.save
      @commissions = CommissionSetting.all
      respond_to do |format|
        format.html do
          render partial: 'commission_list'
        end
        format.js
      end
    else
      render 'new'
    end 
  end

  def edit
    @commission=CommissionSetting.find(params[:id])
  end

  def update
    @commission=CommissionSetting.find(params[:id])
    if @commission.update(commission_settings_params)
      @commissions = CommissionSetting.all
      respond_to do |format|
        format.html do
          render partial: 'commission_list'
        end
        format.js
      end
    else
      render 'edit'
    end 
  end

  def destroy
    @commission=CommissionSetting.find(params[:id])
    @commission.destroy
    @commissions = CommissionSetting.all
    respond_to do |format|
      format.html do
        render(partial: 'commission_list')
      end
      format.js
    end
  end

  def index
    @commissions=CommissionSetting.all
  end

  def show
  end

  private
  def commission_settings_params
    params.require(:commission_setting).permit(:commission_percentage)
  end
end
