class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:home, :about, :help, ]

  def home
    # @buyers = Buyer.all
    # @sellers = Seller.all
    # @inquiries = Inquiry.all  Not yet.
    # if current_user
      @user = current_user
      # @buyer = Buyer.find_by(user_id: @user.id)
      # @seller = Seller.find_by(user_id: @user.id)
    # end
  end

  def about
  end

  def buyerdashboard
    @user = current_user
    @buyer = Buyer.find_by(user_id: @user.id)
    if !@user.buyer
      flash[:notice] = "Only users with buyer profiles can access the buyer dashboard!"
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
      flash[:notice] = "Only users with seller profiles can access the seller dashboard!"
      redirect_to root_path
    end
  end

  def liked
    @user = current_user
    @inquiries =@user.find_liked_items
    # @artists = @user.find_liked_items.map { |item| item.is_a?(Artist) ? item : nil }.compact
    # @arts = @user.find_liked_items.map { |item| item.is_a?(Art) ? item : nil }.compact

    # if @user.find_liked_items.length > 20
    #   @many_liked = true
    #   @user.find_liked_items = @user.find_liked_items[-20..-1]
    # end

    # if params[:m]
    #   @many_liked = false
    #   @user.find_liked_items
    #   end
    #   @user.find_liked_items
    # end


  end



end
