class BuddiesController < ApplicationController

  def index
    @buddies = Buddy.all
  end

  def new
    @buddy = Buddy.new
  end

  def create
    @buddy = Buddy.(buddy_params)
    if @buddy.save
      redirect_to buddy_path(@buddy)
    else
      render :new
    end
  end

  private

  def buddy_params
    params.require(:buddy).permit(:name, :type, :skills, :description, :activities, :rate)
  end
end
