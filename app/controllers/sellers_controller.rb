class SellersController < ApplicationController
  skip_before_action :verify_authenticity_token, only: [:submit]
  skip_before_action :authenticate_user!, only: [:index, :show]
  before_action :set_current_page, only: :index

  def index #do conditional for pagination versus searched.
    @buyer = current_user.buyer if current_user #&& current_user.buyer
    # if current_user.buyer
    #   @buyer = current_user.buyer
    # else
    #   @buyer.nil?
    # end
    @inquiries = @buyer.inquiries if current_user #&& current_user.buyer
    @inquiry = Inquiry.where(buyer_id: @buyer.id ) if current_user #&& current_user.buyer

    if params["search"]
      @filter = params["search"]["types"].reject { |type| type == '' }.concat([params["search"]['age']]).concat([params["search"]['min_age']]).concat([params["search"]["country"]]).concat([params["search"]["sex"]]).concat([params["search"]["occupation"]]).concat([params["search"]["city"]]).concat([params["search"]["income"]]).concat([params["search"]["ethnicity"]]).concat([params["search"]["race"]]).concat([params["search"]["religion"]]).concat([params["search"]["sexuality"]]).concat([params["search"]["politics"]]).concat([params["search"]["relationship_status"]]).concat([params["search"]["children"]]).concat([params["search"]["verified"]]).concat([params["search"]["birth_country"]]).concat([params["search"]["smoker"]]).concat([params["search"]["education_level"]]).flatten.reject(&:blank?)
      # @filter = params["search"]#["search"]
      @sellers = Seller.global_search(@filter)
      # @sellers = Seller.global_search(@filter).paginate(page: params[:page], per_page: 10)  Cuts off mailer, fuck.
      # @inquiries = current_user.inquiries #is this right to get buyer inquiries?
    else
      # @sellers = Seller.all
      @sellers = Seller.paginate(page: params[:page], per_page: 30)
      # @inquiries = current_user.inquiries #is this right to get buyer inquiries?
    end
    # raise
  end

  def notify
    inquiry_id = params.dig(:sellers, :inquiry_id)
    seller_ids = params.dig(:sellers, :ids) # return nil if sellers doesnt exist, it won't break it, clever.
    # find the inquiry,
    if seller_ids.present? && inquiry_id.present? #if inquiry.id is present and seller.id is present, then you do this action mailer method.  Both are needed to send email
      inquiry = Inquiry.find_by(id: "#{inquiry_id}")
      sellers = Seller.where(id: seller_ids.split(","))
      sellers.each do |seller|
        InquiryMailer.invite(current_user.buyer, seller, inquiry).deliver_now #modify this to include the inquiry too, then modify mailer to accept all three, not only the first two, and do deliver_later instead of now
      end
      flash[:notice] = "Congratulations!  Your #{sellers.count} invites are successfully being sent out!"
      redirect_to request.referrer
    end
  end

  def new
    @seller = Seller.new
  end

  def create
    @seller = Seller.new(seller_params)
    @seller.user_id = current_user.id
    if @seller.save
      flash[:notice] = "Your seller profile was successfully created!"
      redirect_to sellerdashboard_path
    else
      flash[:notice] = "There was an error, please try again!"
      render "new"
    end
  end

  def show
    @user = current_user
    @seller = Seller.find(params[:id])
  end

  def update
    @seller = Seller.find(params[:id])
    if @seller.update(seller_params)
      flash[:notice] = "Your seller profile was successfully updated!"
      redirect_to sellerdashboard_path
    else
      flash[:error] = "There was an error, please try again!"
      render 'edit'
    end
  end

  def delete
    @seller = Seller.find(params[:id])
    @seller.destroy
    flash[:notice] = "Your seller profile was successfully deleted!"
    redirect_to root_path
  end

  def edit
    @seller = Seller.find(params[:id])
  end

  def submit
    # raise
  end

  private

  def set_current_page
    @current_page = params[:page]&.to_i || 1
  end

  def seller_params
    params.require(:seller).permit(:age, :country, :sex, :occupation, :city, :income, :ethnicity, :race, :religion, :sexuality, :politics, :relationship_status, :children, :verified, :birth_country, :smoker, :education_level, :types, :inquiry, types: [], income: [], )
  end

end
