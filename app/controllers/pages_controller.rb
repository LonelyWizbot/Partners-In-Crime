class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: :home

  def home
    @partners = Partner.all
  end

  def dashboard
    @partners = Partner.where(user_id: current_user)
    @bookings = Booking.where(partner_id: @partners.pluck(:id))
    @pending_bookings = @bookings.where(status: 'pending')
  end
end
