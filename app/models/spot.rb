class Spot < ApplicationRecord
  has_many :trees
  # belongs_to :user

  # Methods
  # count the different number of taxa of a spot
  def taxa_count()
    # list of taxa of each tree of the spot
    taxa_tab = []
    trees.each do |tree|
      taxa_tab << tree.taxon.common_noun
    end
    # calculation of the total taxa without duplication
    tot = taxa_tab.uniq.length
    return tot
  end
end
