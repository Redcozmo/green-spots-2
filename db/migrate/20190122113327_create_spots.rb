class CreateSpots < ActiveRecord::Migration[5.2]
  def change
    create_table :spots do |t|
      t.string :name
      t.text :description
      t.string :image_url
      t.decimal :latitude
      t.decimal :longitude
      t.timestamps
      # t.belongs_to :user, index: true
    end
  end
end
