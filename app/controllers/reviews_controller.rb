class ReviewsController < ApplicationController
  def new
    @partner = Partner.find(params[:partner_id])
    @review = Review.new
  end

  def create
    @partner = Partner.find(params[:partner_id])
    @review = @partner.review.new(review_params)
    if @review.save
      redirect_to partner_path(@partner)
    else
      render :new, status: :unprocessable_entity
    end
  end

  def destroy
    @review = Review.find(params[:id])
    @review.destroy
    redirect_to @review.partner, notice: "Bookmark was successfully deleted."
  end

  private

  def review_parmas
    params.require(:review).permit(:comment, :partner_id)
  end
end
