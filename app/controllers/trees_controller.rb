class TreesController < ApplicationController

  def new
    @tree = Tree.new
  end

  def index
    @trees = Tree.all
  end

  def map
    @trees = Tree.all
  end

end
