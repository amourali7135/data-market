class SellerinquiriesController < ApplicationController

  def create
    @sellerinquiry = Sellerinquiry.new(sellerinquiry_params)
    @seller = current_user.seller if current_user.seller
    @inquiry = Inquiry.find(params[:sellerinquiry][:inquiry_id])  #it was nested you idiot, focus next time!
    @buyer = @inquiry.buyer
    @sellerinquiry.seller = @seller
    @sellerinquiry.inquiry = @inquiry
    if @sellerinquiry.save
      flash[:notice] = "You've successfully joined this inquiry! Follow the instructions below and then hit complete"
      redirect_to buyer_inquiry_path(@buyer, @inquiry)
    else
      flash[:notice] = "There was an error, please try again!"
      redirect_to buyer_inquiry_path(@buyer, @inquiry)
    end
  end

  def update
    @seller = current_user.seller if current_user.seller ##
    @inquiry = Inquiry.find(params[:sellerinquiry][:inquiry_id])
    @buyer = @inquiry.buyer
    # @sellerinquiry = Sellerinquiry.where(seller_id: @seller.id, inquiry_id: @inquiry.id)[0] #It'll go to update action automatically via this line ala Rayhan.  Why not console working?   IT GIVES AN ARRAY!  LOOK AT THER RESULTS AND ADD [0]  Find_by or [0] with where.
    @sellerinquiry = Sellerinquiry.find_by(params[:sellerinquiry][:id])
    @sellerinquiry.completed = DateTime.current
    if @sellerinquiry.save
      flash[:notice] = "You've successfully completed this inquiry"
      redirect_to buyer_inquiry_path(@buyer, @inquiry)
    else
      flash[:notice] = "There was an error, please try again!"
      redirect_to buyer_inquiry_path(@buyer, @inquiry)
    end
  end


  def sellerinquiry_params
    params.require(:sellerinquiry).permit(:completed, :inquiry_id, :seller_id, )
  end
end

