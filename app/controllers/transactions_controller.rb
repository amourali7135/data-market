class TransactionsController < ApplicationController

  def new
    @transaction = Transaction.new
  end

  def create
    @transaction = Transaction.new(transaction_params)
    # @transaction.user_id = current_user.id
    @data = Data.find(params[:id])
    @inquiry = Inquiry.find(params[:id])
    if @transaction.save
      flash[:notice] = "Your transaction was successfully created!"
      redirect_to @transaction
    else
      flash[:notice] = "There was an error, please try again!"
      render "new"
    end
  end

  def show
    # @user = current_user
    @transaction = Transaction.find(params[:id])
  end

  def update
    @transaction = Transaction.find(params[:id])
    if @transaction.update(transaction_params)
      flash[:notice] = "Your transaction profile was successfully updated!"
      redirect_to buyer_dashboard_path
    else
      flash[:error] = "There was an error, please try again!"
      render 'edit'
    end
  end

  def delete
    @transaction = Transaction.find(params[:id])
    @transaction.destroy
    flash[:notice] = "Your transaction profile was successfully deleted!"
    redirect_to root_path
  end

  def edit
    @transaction = Transaction.find(params[:id])
  end

  private

  def transaction_params
    params.require(:transaction).permit(:date, :price :types, types: [], )
  end
end
