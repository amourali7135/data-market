# class DataController < ApplicationController

#   def new
#     @seller = Seller.find(params[:seller_id])
#     @data = Data.new
#   end

#   def show
#     @seller = Seller.find(params[:seller_id])
#     @data = Data.find(params[:id])
#   end

#   def create
#     @data = Data.new(data_params)
#     @seller = Seller.find(params[:seller_id])
#     @data.seller = @seller
#     if @data.save
#       flash[:notice] = "Your buyer profile was successfully created!"
#       redirect_to business_product_path(@seller, @data)
#     else
#       flash[:notice] = "Your buyer profile was successfully created!"
#       render :new
#     end
#   end


#   def update
#     @data = Data.find(params[:id])
#     if @data.update(data_params)
#       flash[:notice] = "Your buyer profile was successfully created!"
#       redirect_to business_product_path(@data.seller, @data) #get from rails routes
#     else
#       flash[:notice] = "Your buyer profile was successfully created!"
#       render 'edit'
#     end
#   end

#   def delete
#     @data = Data.find(params[:id])
#     @data.destroy
#     redirect_to products
#   end

#   def edit
#     @data = Data.find(params[:id])
#     @seller = Seller.find(params[:seller_id])
#   end

#   private

#   def data_params
#     params.require(:data).permit(:name, :description, :price_cents, :category, :photo)
#   end
# end
