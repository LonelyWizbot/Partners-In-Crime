class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: :home

  def home
    @partners = Partner.all
  end

  def dashboard
  end

  private

end
