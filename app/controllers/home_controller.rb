class HomeController < ApplicationController
  def landing
  end
  def index
    @spots = Spot.all
  end
end
