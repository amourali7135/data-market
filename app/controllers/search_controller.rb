class SearchController < ApplicationController
  def index
    if params[:query].present?
      sellers = Seller.search(params[:query]) && inquiry = Inquiry.search(params[:query])
    end
  end
