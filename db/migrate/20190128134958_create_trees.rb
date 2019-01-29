class CreateTrees < ActiveRecord::Migration[5.2]
  def change
    create_table :trees do |t|
      t.string :name
      t.text :description
      t.decimal :latitude
      t.decimal :longitude
      t.timestamps
      t.belongs_to :spot, index: true
      t.belongs_to :taxon, index: true
    end
  end
end
