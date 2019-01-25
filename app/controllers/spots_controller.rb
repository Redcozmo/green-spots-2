class SpotsController < ApplicationController
  def new
    @spot = Spot.new
  end
  def index
    @spots = Spot.all
  end
end
