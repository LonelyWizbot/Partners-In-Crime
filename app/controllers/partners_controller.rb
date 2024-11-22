class PartnersController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index, :show]

  def index
    @partners = Partner.all
  end

  def show
    @partner = Partner.find(params[:id])
    @booking = Booking.new
    @marker =
      [{
        latitude: @partner.latitude,
        longitude: @partner.longitude
      }]
  end

  def new
    @partner = Partner.new
  end

  def create
    @partner = Partner.new(strong_params)
    @user = current_user
    @partner.user = @user
    if @partner.save
      redirect_to dashboard_path(@user)
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
    @partner = Partner.find(params[:id])
  end

  def update
    @partner = Partner.find(params[:id])
    if @partner.update(strong_params)
      redirect_to dashboard_path(@user)
    else
      render :edit
    end
  end

  def destroy
    @partner = Partner.find(params[:id])
    @partner.destroy
    redirect_to dashboard_path(@user)
  end

  private

  def strong_params
    params.require(:partner).permit(:title, :address, :description, :image, :price, :name)
  end
end
