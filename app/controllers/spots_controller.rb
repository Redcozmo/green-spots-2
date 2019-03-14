class SpotsController < ApplicationController

  def new
    @spot = Spot.new
  end

  def index
    @spots = Spot.all
  end

  def create
    spot = Spot.new(post_params)
    if spot.valid?
      spot.save
      redirect_to spot_path(spot.id), success: "Spot créé avec succès"
    else
      @spot = spot
      render 'new'
    end
  end

  def show
    @spot = Spot.find(params[:id])
  end

  def show_map
    @spot = Spot.find(params[:id])
  end

  def map
    @spots = Spot.all
  end

  def map_test
  end

  def geoloc
  end

  private

  def post_params
    params.require(:spot).permit(:name, :description, :image_url, :longitude)
  end

end
