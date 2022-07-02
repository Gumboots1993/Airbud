class BuddiesController < ApplicationController

  def index
    if params[:query].present?
      sql_query = "buddy_type ILIKE :query OR activities ILIKE :query OR description ILIKE :query"
      @buddies = Buddy.where(sql_query, query: "%#{params[:query]}%")
    else
      @buddies = Buddy.all
      @markers = @buddies.geocoded.map do |buddy|
        {
          lat: buddy.latitude,
          lng: buddy.longitude,
          info_window: render_to_string(partial: "info_window", locals: { buddy: buddy }),
          image_url: helpers.asset_url(buddy.url)
        }
      end
    end
  end

  def show
    @buddy = Buddy.find(params[:id])
    @marker = [{
        lat: @buddy.latitude,
        lng: @buddy.longitude,
        info_window: render_to_string(partial: "info_window", locals: { buddy: @buddy }),
        image_url: helpers.asset_url(@buddy.url)
      }]
  end

  def new
    @buddy = Buddy.new
  end

  def create
    @buddy = Buddy.new(buddy_params)
    @buddy.user = current_user
    if @buddy.save
      redirect_to buddy_path(@buddy)
    else
      render :new
    end
  end

  def edit
    @buddy = Buddy.find(params[:id])
  end

  def update
    @buddy = Buddy.find(params[:id])
    if @buddy.update(buddy_params)
      redirect_to @buddy, notice: 'Buddy successfully updated'
    else
      render :edit
    end
  end

  def destroy
    @buddy = Buddy.find(params[:id])
    @buddy.destroy
    redirect_to buddies_path
  end

  private

  def buddy_params
    params.require(:buddy).permit(:name, :buddy_type, :skills, :description, :activities, :rate, :location, :url)
  end
end
