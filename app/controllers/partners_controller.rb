class PartnersController < ApplicationController
  skip_before_action :authenticate_user!, only: :index

  def index
    @partners = Partner.all
  end

  def new
    @partner = Partner.new
  end

  def create
    @partner = Partner.new(strong_params)
    if @partner.save
      redirect_to partner_path(@partner)
    else
      render :new, status: :unprocessable_entity
    end
  end

  private

  def strong_params
    params_require(:partner).permit(:title, :description, :image, :price)
  end
end
