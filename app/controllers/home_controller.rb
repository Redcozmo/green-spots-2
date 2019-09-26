class HomeController < ApplicationController

  def index
    @spots = Spot.all
    @trees = Tree.all
    @taxons = Taxon.all
  end

end
