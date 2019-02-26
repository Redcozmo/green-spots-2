class TreesController < ApplicationController
  def new
    @tree = Tree.new
    @taxons = Taxon.all
  end
  def index
    @trees = Tree.all
  end
end
