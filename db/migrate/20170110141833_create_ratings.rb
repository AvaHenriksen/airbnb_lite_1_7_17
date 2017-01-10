class CreateRatings < ActiveRecord::Migration
  def change
    create_table :ratings do |t|
      t.integer :host_id
      t.integer :guest_id
      t.integer :booking_id
      t.text :body
      t.integer :rating

      t.timestamps

    end
  end
end
