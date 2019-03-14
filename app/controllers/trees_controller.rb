class TreesController < ApplicationController

  def new
    @tree = Tree.new
  end

  def index
    @trees = Tree.all
  end

  def create
    tree = Tree.new(post_params)
    if tree.valid?
      tree.save
      redirect_to tree_path(tree.id), success: "Arbre créé avec succès"
    else
      @tree = tree
      render 'new'
    end
  end

  def show
    @tree = Tree.find(params[:id])
  end

  def map
    @trees = Tree.all
  end

  private

  def post_params
    params.require(:tree).permit(:name, :description, :latitude, :longitude, :taxon_id, :spot_id)
  end

end
