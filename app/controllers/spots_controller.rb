class SpotsController < ApplicationController
  def new
    @spot = Spot.new
  end

  def index
    @spots = Spot.all
  end

  def show
    @spot = Spot.find(params[:id])
  end

  def map
    @spots = Spot.all
  end

  def map_test
  end

  def geoloc
  end

end
