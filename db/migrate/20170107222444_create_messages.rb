class CreateMessages < ActiveRecord::Migration
  def change
    create_table :messages do |t|
      t.integer :host_id
      t.integer :guest_id
      t.text :text

      t.timestamps

    end
  end
end
