class InquiriesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index, :show ]
  before_action :set_current_page, only: :index


  def index
    if params["search"] #reject '' in middle added 112619
      # @filter = params["search"]
      # @filter = params["search"]["tag_list"].concat([params["search"]['types']]).concat([params["search"]["reward"]]).concat([params["search"]["types"]]).concat([params["search"]["tag_list"]]).flatten.reject(&:blank?)
      @filter = params["search"]["tag_list"].concat([params["search"]['types']]).flatten.reject(&:blank?)
      # @buyers = Buyer.global_search(@filter)
      @inquiries = Inquiry.global_search(@filter).paginate(page: @current_page, per_page: 15)
    else #112619 I added this while trying to get sort to work.
      # @buyers = Buyer.all        This was an N + 1, wow dude.
      @inquiries = Inquiry.includes([:buyer]).paginate(page: @current_page, per_page: 15)
      if @current_page > 1

        respond_to do |format|
          format.html
          format.js
        end
      end
    end

  end

  def new
    @buyer = Buyer.find(params[:buyer_id])
    @inquiry = Inquiry.new
  end

  def create
    @inquiry = Inquiry.new(inquiry_params)
    # @inquiry.user_id = @buyer.user_id
    @buyer = Buyer.find(params[:buyer_id])
    @inquiry.buyer = @buyer
    if @inquiry.save
      flash[:notice] = "Your inquiry was successfully created!"
      redirect_to buyerdashboard_path
    else
      flash[:notice] = "There was an error, please try again!"
      render "new"
    end
  end

  def show
    @user = current_user
    @seller = current_user.seller if user_signed_in? # current_user.seller  user_signed_in? is so fucking clutch!
    @buyer = Buyer.find(params[:buyer_id])
    @inquiry = Inquiry.find(params[:id])
    # @sellerinquiry = Sellerinquiry.new || Sellerinquiry.find_by(seller_id: current_user.seller.id, inquiry_id: @inquiry.id)
    if
      user_signed_in? && @seller.present? && Sellerinquiry.where(inquiry_id: @inquiry.id, seller_id: @seller.id).present?
      @sellerinquiry = Sellerinquiry.find_by(inquiry_id: @inquiry.id, seller_id: @seller.id)
    else
      @sellerinquiry = Sellerinquiry.new
    end
    @inquiry.punch(request)
    # @conversation = Conversation.find_by(author: @user, receiver: @artist)
    # raise
  end

  def update
    @inquiry = Inquiry.find(params[:id])
    if @inquiry.update(inquiry_params)
      flash[:notice] = "Your inquiry was successfully updated!"
      redirect_to buyerdashboard_path
    else
      flash[:error] = "There was an error, please try again!"
      render 'edit'
    end

  end

  def destroy
    @inquiry = Inquiry.find(params[:id])
    @inquiry.destroy
    flash[:notice] = "Your inquiry was successfully deleted!"
    redirect_to buyerdashboard_path
  end

  def edit
    @buyer = Buyer.find(params[:buyer_id])
    @inquiry = Inquiry.find(params[:id])
  end

  def like
    @user = current_user # before_action :authenticate_user, only: [:likes]
    @inquiry = Inquiry.find(params[:id])
    @inquiry.liked_by @user
    redirect_to @inquiry, notice: "Liked this inquiry successfully!"
  end

  def unlike
    @user = current_user # before_action :authenticate_user, only: [:likes]
    @inquiry = Inquiry.find(params[:id])
    @inquiry.unliked_by @user
    redirect_to @inquiry, notice: "Unliked this inquiry successfully!"
  end

  private

  def set_current_page
    @current_page = params[:page]&.to_i || 1
  end

  def inquiry_params #stop forgetting columns man!
    params.require(:inquiry).permit(:information_usage, :requirements, :reward, :anonymous, :total, :title, :format, :instructions, :hidden, :price_cents, :active, :types, types: [], tag_list: [],  )
  end

end
