class OrdersController < ApplicationController
  def new
    @order = Order.new
  end

  def create
    @order = Order.new(order_params)
    @buyer = Buyer.find(params[:id])
    @trade = Trade.find(params[:id])
    if @order.save
      flash[:notice] = "Your order was successfully created!"
      redirect_to @order
    else
      flash[:notice] = "There was an error, please try again!"
      render "new"
    end
  end

  def show
    # @user = current_user
    @order = Order.find(params[:id])
  end

  def update
    @order = Order.find(params[:id])
    if @order.update(order_params)
      flash[:notice] = "Your order profile was successfully updated!"
      redirect_to buyer_dashboard_path
    else
      flash[:error] = "There was an error, please try again!"
      render 'edit'
    end
  end

  def delete
    @order = Order.find(params[:id])
    @order.destroy
    flash[:notice] = "Your order profile was successfully deleted!"
    redirect_to root_path
  end

  def edit
    @order = Order.find(params[:id])
  end

  private

  def order_params
    params.require(:order).permit(:deposit, :amount,  :types, types: [], )
  end
end
