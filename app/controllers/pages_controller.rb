class PagesController < ApplicationController
  def home
  end

  def dashboard
    @user_buddies = current_user.buddies
    @bookings = current_user.bookings
  end
end
