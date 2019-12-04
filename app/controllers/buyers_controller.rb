class BuyersController < ApplicationController
  def index
    @buyers = Buyer.all
  end

  def new
    @buyer = Buyer.new
  end

  def create
    @buyer = Buyer.new(buyer_params)
    @buyer.user_id = current_user.id
    if @buyer.save
      flash[:notice] = "Your buyer profile was successfully created!"
      redirect_to buyer_dashboard_path
    else
      flash[:notice] = "There was an error, please try again!"
      render "new"
    end
  end

  def show
    @user = current_user
    # @user = User.find(params[:user_id])
    @buyer = Buyer.find(params[:id])
  end

  def update
    @buyer = Buyer.find(params[:id])
    if @buyer.update(buyer_params)
      flash[:notice] = "Your buyer profile was successfully updated!"
      redirect_to buyer_dashboard_path
    else
      flash[:error] = "There was an error, please try again!"
      render 'edit'
    end
  end

  def delete
    @buyer = Buyer.find(params[:id])
    @buyer.destroy
    flash[:notice] = "Your buyer profile was successfully deleted!"
    redirect_to root_path
  end

  def edit
    @buyer = Buyer.find(params[:id])
  end

  private

  def buyer_params
    params.require(:buyer).permit(:name, :biography, :intentions, :website, :contact, :size, :photo, :country, :city, :phone, :email, :types, types: [], )
  end

end
