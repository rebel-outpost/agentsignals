class AddFieldsToListings < ActiveRecord::Migration
  def change
    add_column :listings, :latitude, :float
    add_column :listings, :longitude, :float
    add_column :listings, :full_address, :string
  end
end
