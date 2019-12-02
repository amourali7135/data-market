class PaymentsController < ApplicationController
  def new
    @payment = Payment.new
  end

  def create
    @payment = Payment.new(payment_params)
    @buyer = Buyer.find(params[:id])
    @transaction = Transaction.find(params[:id])
    if @payment.save
      flash[:notice] = "Your payment was successfully created!"
      redirect_to @payment
    else
      flash[:notice] = "There was an error, please try again!"
      render "new"
    end
  end

  def show
    # @user = current_user
    @payment = Payment.find(params[:id])
  end

  def update
    @payment = Payment.find(params[:id])
    if @payment.update(payment_params)
      flash[:notice] = "Your payment profile was successfully updated!"
      redirect_to buyer_dashboard_path
    else
      flash[:error] = "There was an error, please try again!"
      render 'edit'
    end
  end

  def delete
    @payment = Payment.find(params[:id])
    @payment.destroy
    flash[:notice] = "Your payment profile was successfully deleted!"
    redirect_to root_path
  end

  def edit
    @payment = Payment.find(params[:id])
  end

  private

  def payment_params
    params.require(:payment).permit(:deposit, :amount,  :types, types: [], )
  end
end
