class TradesController < ApplicationController

  def new
    @trade = Trade.new
  end

  def create
    @trade = Trade.new(trade_params)
    # @trade.user_id = current_user.id
    @data = Data.find(params[:id])
    @inquiry = Inquiry.find(params[:id])
    if @trade.save
      flash[:notice] = "Your trade was successfully created!"
      redirect_to @trade
    else
      flash[:notice] = "There was an error, please try again!"
      render "new"
    end
  end

  def show
    # @user = current_user
    @trade = Trade.find(params[:id])
  end

  def update
    @trade = Trade.find(params[:id])
    if @trade.update(trade_params)
      flash[:notice] = "Your trade profile was successfully updated!"
      redirect_to buyer_dashboard_path
    else
      flash[:error] = "There was an error, please try again!"
      render 'edit'
    end
  end

  def delete
    @trade = Trade.find(params[:id])
    @trade.destroy
    flash[:notice] = "Your trade profile was successfully deleted!"
    redirect_to root_path
  end

  def edit
    @trade = Trade.find(params[:id])
  end

  private

  def trade_params
    params.require(:trade).permit(:date, :price :types, types: [], )
  end
end
