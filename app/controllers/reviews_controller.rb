class ReviewsController < ApplicationController
  def index
    @partner = Partner.find(params[:partner_id])
    @reviews = @partner.reviews
  end

  def new
    @partner = Partner.find(params[:partner_id])
    @review = Review.new
  end

  def create
    @review = Review.new(review_params)
    @partner = Partner.find(params[:partner_id])
    @review.partner = @partner
    @review.user = current_user
    if @review.save
      redirect_to partner_path(@partner), notice: 'Review created successfully!'
    else
      render :new, status: :unprocessable_entity
    end
  end

  def destroy
    @review = Review.find(params[:id])
    @review.destroy
    redirect_to @review.partner, notice: "Review was successfully deleted."
  end

  private

  def review_params
    params.require(:review).permit(:comment, :rating, :partner_id, :user_id)
  end
end
