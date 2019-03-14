class TaxonsController < ApplicationController
  
  def new
    @taxon = Taxon.new
  end

  def index
    @taxons = Taxon.all
  end

end
