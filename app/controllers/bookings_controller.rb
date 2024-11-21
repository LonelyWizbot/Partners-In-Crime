class BookingsController < ApplicationController
  def create
    @booking = Booking.new(booking_params)

    @partner = Partner.find(params[:partner_id])
    @user = current_user
    @booking.partner = @partner
    @booking.user = @user

    if @booking.save
      redirect_to partner_booking_path(@partner, @booking)
    else
      render 'partners/show', status: :unprocessable_entity
    end
  end

  def show
    @booking = Booking.find(params[:id])
  end

  def destroy
    @booking = Booking.find(params[:id])
    @dashboard = @booking.dashboard
    @booking.destroy
    redirect_to dashboard_path(@booking), status: :see_other
  end

  def accept
    @booking = Booking.find(params[:id])
    @partner = Partner.find(params[:partner_id])
    @booking.update(status: 1)
    redirect_to partner_booking_path(@partner, @booking)
  end

  def decline
    @booking = Booking.find(params[:id])
    @partner = Partner.find(params[:partner_id])
    @booking.update(status: 2)
    redirect_to partner_booking_path(@partner, @booking)
  end

  private

  def booking_params
    params.require(:booking).permit(:start_date, :end_date, :message, :total_price)
  end
end
