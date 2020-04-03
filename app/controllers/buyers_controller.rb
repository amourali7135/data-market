class BuyersController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index, :show ]
  before_action :set_current_page, only: :index

  def index
    # @buyers = Buyer.all
    @buyers = Buyer.paginate(page: @current_page, per_page: 10)
    if @current_page > 1
      # @buyers = Buyer.includes(:name, :biography, :intentions, :website, :contact, :size, :photo, :country, :city, :phone, :email, :types, types: [],).paginate(page: @current_page, per_page: 8)
      # @buyers = Buyer.paginate(page: @current_page, per_page: 8)
      respond_to do |format|
        format.html
        format.js
      end
    end

  end


end

def new
  @buyer = Buyer.new
end

def create
  @buyer = Buyer.new(buyer_params)
  @buyer.user_id = current_user.id
  if @buyer.save
    flash[:notice] = "Your buyer profile was successfully created!"
    redirect_to buyerdashboard_path
  else
    flash[:notice] = "There was an error, please try again!"
    render "new"
  end
end

def show
  @user = current_user
  # @user = User.find(params[:user_id])
  @buyer = Buyer.find(params[:id])
  @inquiries = @buyer.inquiries
  # @inquiry = @buyer.inquiries.all
  # @conversation = Conversation.find_by(author: @user, receiver: @artist)
end

def update
  @buyer = Buyer.find(params[:id])
  if @buyer.update(buyer_params)
    flash[:notice] = "Your buyer profile was successfully updated!"
    redirect_to buyerdashboard_path
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

def set_current_page
  @current_page = params[:page]&.to_i || 1
end

def buyer_params
  params.require(:buyer).permit(:name, :biography, :intentions, :website, :contact, :size, :photo, :country, :city, :phone, :email, :types, types: [], )
end

# end
