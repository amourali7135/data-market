class SearchController < ApplicationController
  def index
    if params[:query].present?
      sellers = Seller.search(params[:query]) && inquiries = Inquiry.search(params[:query]) && buyers = Buyer.search(params[:query])
    end
  end
end