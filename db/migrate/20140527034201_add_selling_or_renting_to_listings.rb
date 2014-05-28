class AddSellingOrRentingToListings < ActiveRecord::Migration
  def change
    add_column :client_listings, :renting, :boolean, default: false
    add_column :client_listings, :selling, :boolean, default: false
  end
end
