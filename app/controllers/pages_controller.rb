class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: :home

  def home
    @partners = Partner.all
    if params[:query].present?
      @partners = @partners.search_by_title_and_description(params[:query])
    end
  end

  def dashboard
    @partners = Partner.where(user_id: current_user)
    @bookings = Booking.where(partner_id: @partners.pluck(:id))
    @pending_bookings = @bookings.where(status: 'pending')
  end
end
