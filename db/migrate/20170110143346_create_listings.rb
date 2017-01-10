class CreateListings < ActiveRecord::Migration
  def change
    create_table :listings do |t|
      t.string :title
      t.string :private_room_or_entire_home
      t.string :photos
      t.text :description
      t.integer :bedrooms
      t.integer :bathrooms
      t.integer :beds
      t.string :max_occupants
      t.string :neighborhood
      t.string :city
      t.text :policies
      t.integer :default_price_per_night
      t.string :nights_available
      t.string :price
      t.integer :host_id

      t.timestamps

    end
  end
end
