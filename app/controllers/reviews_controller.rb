class ReviewsController < ApplicationController
  def new
    @review = Review.new
  end

  def create
    @review = Review.new(review_params)
    @buyer = Buyer.find(params[:id])
    @review.user_id = current_user.id
    if @review.save
      flash[:notice] = "Your review was successfully created!"
      redirect_to @review
    else
      flash[:notice] = "There was an error, please try again!"
      render "new"
    end
  end

  def show
    @review = Review.find(params[:id])
  end

  def update
    @review = Review.find(params[:id])
    if @review.update(review_params)
      flash[:notice] = "Your review profile was successfully updated!"
      redirect_to dashboard_path
    else
      flash[:error] = "There was an error, please try again!"
      render 'edit'
    end
  end

  def delete
    @review = Review.find(params[:id])
    @review.destroy
    flash[:notice] = "Your review was successfully deleted!"
    redirect_to root_path
  end

  def edit
    @review = Review.find(params[:id])
  end

  private

  def review_params
    params.require(:review).permit(:information, :requirements, :usage, :reward, :anonymous, :total, :accept?,  :types, types: [], )
  end
end
