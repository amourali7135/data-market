class SellersController < ApplicationController
  skip_before_action :verify_authenticity_token, only: [:submit]

  def index
    @buyer = current_user.buyer if current_user.buyer
    @inquiries = @buyer.inquiries if current_user.buyer
    if params["search"]
      @filter = params["search"]["types"].reject { |type| type == '' }.concat([params["search"]['age']]).concat([params["search"]['min_age']]).concat([params["search"]["country"]]).concat([params["search"]["sex"]]).concat([params["search"]["occupation"]]).concat([params["search"]["city"]]).concat([params["search"]["income"]]).concat([params["search"]["ethnicity"]]).concat([params["search"]["race"]]).concat([params["search"]["religion"]]).concat([params["search"]["sexuality"]]).concat([params["search"]["politics"]]).concat([params["search"]["relationship_status"]]).concat([params["search"]["children"]]).concat([params["search"]["verified"]]).concat([params["search"]["birth_country"]]).concat([params["search"]["smoker"]]).concat([params["search"]["education_level"]]).flatten.reject(&:blank?)
      # @filter = params["search"]#["search"]
      @sellers = Seller.global_search(@filter)
      @inquiries = current_user.inquiries #is this right to get buyer inquiries?
    else
      @sellers = Seller.all
      @inquiries = current_user.inquiries #is this right to get buyer inquiries?
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

  def seller_params
    params.require(:seller).permit(:age, :country, :sex, :occupation, :city, :income, :ethnicity, :race, :religion, :sexuality, :politics, :relationship_status, :children, :verified, :birth_country, :smoker, :education_level, :types, types: [], income: [], )
  end
end
