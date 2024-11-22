class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: :home

  def home
    @partners = Partner.all
    if params[:query].present?
      @partners = @partners.search_by_title_and_description(params[:query])
    end

    @markers = @partners.map do |partner|
      {
        latitude: partner.latitude,
        longitude: partner.longitude,
        partner: {
          title: partner.title,
          price: partner.price.to_i,
          url: "/partners/#{partner.id}"
        }
      }
    end
  end

  def dashboard
    @partners = Partner.where(user_id: current_user)
    @bookings = Booking.where(partner_id: @partners.pluck(:id))
    @pending_bookings = @bookings.where(status: 'pending')
    @accepted_bookings = @bookings.where(status: 'accepted')
    @booking_requests = Booking.where(user_id: current_user)
  end
end
