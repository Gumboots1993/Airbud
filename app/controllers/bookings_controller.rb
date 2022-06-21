class BookingsController < ApplicationController
  before_action :set_buddy, only: [:new, :create]

  def new
    @booking = Booking.new
  end

  def show
    set_booking
  end

  def create
    @booking = Booking.new(booking_params)
    @booking.user = current_user
    @booking.buddy = set_buddy
    if @booking.save
      redirect_to booking_path(@booking)
    else
      render :new
    end
  end

  def accept
    @booking.status = "Accepted"
  end

  def decline
    @booking.status = "Declined"
  end

  private

  def set_booking
    @booking = Booking.find(params[:id])
  end

  def set_buddy
    @buddy = Buddy.find(params[:buddy_id])
  end

  def booking_params
    params.require(:booking).permit(:start_date, :end_date)
  end
end
