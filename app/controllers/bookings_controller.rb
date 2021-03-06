class BookingsController < ApplicationController
  before_action :set_buddy, only: [:new, :create]
  before_action :set_booking, only: [:accept, :decline, :cancel]

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

  def edit
    @booking = Booking.find(params[:id])
  end

  def update
    @booking = Booking.find(params[:id])
    if @booking.update(booking_params)
      redirect_to @booking, notice: 'Booking successfully updated'
    else
      render :edit
    end
  end

  def accept
    @booking.status = "Accepted"
    if @booking.save
      redirect_to my_listings_path
    else
      render :new
    end
  end

  def decline
    @booking.status = "Declined"
    if @booking.save
      redirect_to my_listings_path
    else
      render :new
    end
  end

  def cancel
    @booking.status = "Cancelled"
    if @booking.save
      redirect_back(fallback_location: root_path)
    else
      render :new
    end
  end

  def destroy
    @booking = Booking.find(params[:id])
    @booking.destroy
    redirect_to root_path
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
