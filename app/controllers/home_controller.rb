class HomeController < ApplicationController

  def landing
  end

  def index
    @spots = Spot.all
    @trees = Tree.all
    @taxons = Taxon.all
  end

end
