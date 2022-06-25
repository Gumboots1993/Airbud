class PagesController < ApplicationController
  def home
  end

  def my_listings
    @user_buddies = current_user.buddies
    @bookings = current_user.bookings
  end
end
