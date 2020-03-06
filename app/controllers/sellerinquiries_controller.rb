class SellerinquiriesController < ApplicationController
  
  def create
    @sellerinquiry = Sellerinquiry.new(sellerinquiry_params)
    @seller = current_user.seller if current_user.seller
    @inquiry = Inquiry.find(params[:sellerinquiry][:inquiry_id])  #it was nested you idiot, focus next time!
    @buyer = @inquiry.buyer
    @sellerinquiry.seller = @seller
    @sellerinquiry.inquiry = @inquiry
    @sellerinquiry.completed = DateTime.current
    if @sellerinquiry.save
      flash[:notice] = "You've successfully joined this inquiry! Follow the instructions and then hit complete"
      redirect_to buyer_inquiry_path(@buyer, @inquiry) 
      # redirect_to @inquiry
    else
      flash[:notice] = "There was an error, please try again!"
      redirect_to buyer_inquiry_path(@buyer, @inquiry) 
      # redirect_to @inquiry
    end
    if @sellerinquiry.completed
      flash[:notice] = "You've successfully completed this inquiry"
      redirect_to buyer_inquiry_path(@buyer, @inquiry) 
    end
  end

  def update
    @sellerinquiry = Sellerinquiry.where(seller_id = current_user.seller.id && inquiry_id = @inquiry.id)

  end
  
  
  def sellerinquiry_params
    params.require(:sellerinquiry).permit(:completed, :inquiry_id, :seller_id, )
  end
end

