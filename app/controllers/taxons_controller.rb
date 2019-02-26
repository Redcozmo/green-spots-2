class TaxonsController < ApplicationController
  def new
    @taxon = Taxon.new
    @taxons = Taxon.all
  end

end
