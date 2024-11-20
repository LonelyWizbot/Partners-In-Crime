class BookingsController < ApplicationController
  def new
    @booking = Booking.new
  end

  def create
    @booking = Booking.new(booking_params)
    if @booking.save
      redirect dashboard_path(@booking)
    else
      render :new, status: :unprocessable_entity
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

  private

  def booking_params
    params.require(:booking).permit(:start_date, :end_date, :message, :total_price)
  end
end
