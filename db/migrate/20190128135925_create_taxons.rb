class CreateTaxons < ActiveRecord::Migration[5.2]
  def change
    create_table :taxons do |t|
      t.string :common_noun
      t.string :family
      t.string :genus
      t.string :species
      t.timestamps
    end
  end
end
