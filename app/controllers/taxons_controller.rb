class TaxonsController < ApplicationController

  def new
    @taxon = Taxon.new
  end

  def index
    @taxons = Taxon.all
  end

  def create
    taxon = Taxon.new(post_params)
    if taxon.valid?
      taxon.save
      redirect_to taxon_path(taxon.id), success: "Taxon créé avec succès"
    else
      @taxon = taxon
      render 'new'
    end
  end

  def show
    @taxon = Taxon.find(params[:id])
  end

  private

  def post_params
    params.require(:taxon).permit(:common_noun, :family, :genus, :species)
  end

end
