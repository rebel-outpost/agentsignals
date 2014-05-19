class CreateClientListings < ActiveRecord::Migration
  def change
    create_table :client_listings do |t|
      t.integer :user_id
      t.integer :listing_id

      t.timestamps
    end
    add_index :client_listings, [:user_id, :listing_id], unique: true
  end
end
