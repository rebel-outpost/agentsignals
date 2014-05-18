class UpdateFieldsToListings < ActiveRecord::Migration
  def change
    change_column :listings, :beds, :string, default: "N/A"
    change_column :listings, :baths, :string, default: "N/A"
    change_column :listings, :house_size, :string, default: "N/A"
    change_column :listings, :property_type, :string, default: "N/A"
    change_column :listings, :stories, :integer, default: 0
    change_column :listings, :lot_size, :string, default: "N/A"
    change_column :listings, :year_built, :string, default: "N/A"
    change_column :listings, :garage, :string, default: "N/A"
  end
end
