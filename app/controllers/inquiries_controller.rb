class InquiriesController < ApplicationController
  def index
    @buyers = Buyer.all  #MEMORY WILL KILL, OH well...
    @inquiries = Inquiry.all
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
    @inquiry = Inquiry.find(params[:id])
  end

  def update
    @inquiry = Inquiry.find(params[:id])
    if @inquiry.update(inquiry_params)
      flash[:notice] = "Your inquiry profile was successfully updated!"
      redirect_to dashboard_path
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
    @inquiry = Inquiry.find(params[:id])
  end

  private

  def inquiry_params
    params.require(:inquiry).permit(:information_usage, :requirements, :reward, :anonymous, :total, :accept?,  :types, types: [], )
  end
end
