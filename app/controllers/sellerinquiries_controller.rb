class SellerinquiriesController < ApplicationController
  
  def create
    @sellerinquiry = Sellerinquiry.new(sellerinquiry_params)
    @seller = current_user.seller if current_user.seller
    @inquiry = Inquiry.find(params[:id]) 
    @sellerinquiry.seller = @seller
    @sellerinquiry.inquiry = @inquiry
    if @sellerinquiry.save
      flash[:notice] = "You've successfully joined this inquiry! Follow the instructions and then hit complete"
      redirect_to inquiry_path
    else
      flash[:notice] = "There was an error, please try again!"
      render @inquiry
    end
  end
  
  
  def sellerinquiry_params
    params.require(:sellerinquiry).permit(:completed, :inquiry_id, :seller_id,  )
  end
end