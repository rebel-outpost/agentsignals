class AddMoreFieldsToListings < ActiveRecord::Migration
  def change
    add_column :listings, :beds, :string
    add_column :listings, :baths, :string
    add_column :listings, :house_size, :string
    add_column :listings, :property_type, :string
    add_column :listings, :stories, :integer
    add_column :listings, :lot_size, :string
    add_column :listings, :year_built, :string
    add_column :listings, :garage, :string
  end
end
