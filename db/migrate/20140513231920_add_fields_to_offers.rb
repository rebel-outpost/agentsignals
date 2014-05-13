class AddFieldsToOffers < ActiveRecord::Migration
  def change
    add_column :offers, :price, :decimal
    add_column :offers, :seller_name, :string
  end
end
