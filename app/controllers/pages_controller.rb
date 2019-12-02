class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:home]

  def home
    # @buyers = Buyer.all
    # @sellers = Seller.all
    # @inquiries = Inquiry.all
    if current_user
      @user = current_user
      @buyer = Buyer.find_by(user_id: @user.id) || @seller = Seller.find_by(user_id: @user.id)
    end
  end

  def about
  end

  def buyerdashboard
    @user = current_user
    @buyer = Buyer.find_by(user_id: @user.id)
    if !@user.buyer
      flash[:notice] = "Only users with buyer profiles can access this dashboard!"
      redirect_to root_path
    end
  end

  def contact
  end

  def help
  end

  def registered
    @user = current_user
  end

  def sellerdashboard
    @user = current_user
    @seller = Seller.find_by(user_id: @user.id)
    if !@user.seller
      flash[:notice] = "Only users with seller profiles can access this dashboard!"
      redirect_to root_path
    end
  end


end
