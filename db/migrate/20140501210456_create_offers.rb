class CreateOffers < ActiveRecord::Migration
  def change
    create_table :offers do |t|
      t.integer :contact_id
      t.integer :listing_id
      t.integer :agent_id
      t.string :offer_amount
      t.datetime :offer_sent_at
      t.datetime :offer_expiration
      t.string :counter_offer_amount
      t.datetime :counter_offer_received_at

      t.timestamps
    end
    add_index :offers, :contact_id
    add_index :offers, :listing_id
    add_index :offers, :agent_id
  end
end
