class CreateReviews < ActiveRecord::Migration
  def change
    create_table :reviews do |t|
      t.integer :listing_id
      t.integer :guest_id
      t.integer :accuracy
      t.integer :communication
      t.integer :cleanliness
      t.integer :location
      t.string :check_in_15
      t.integer :value
      t.text :body

      t.timestamps

    end
  end
end
