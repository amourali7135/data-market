class SellersController < ApplicationController
  def index
    if params["search"]
      @filter = params["search"]["tag_ids"].reject { |tag| tag == '' }.concat([params['country']]).concat([params["search"]["city"]]).concat([params["search"]["country"]]).flatten.reject(&:blank?)
      @sellers = Seller.global_search(@filter)
    else
      @sellers = Seller.all
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
      redirect_to @seller
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
  
  private
  
  def seller_params
    params.require(:seller).permit(:age, :country, :sex, :occupation, :city, :income, :ethnicity, :race, :religion, :sexuality, :politics, :relationship_status, :children, :verified, :birth_country, :smoker, :education_level, :types, types: [], income: [], )
  end
end
