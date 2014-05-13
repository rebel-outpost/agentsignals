class AddFieldsToListing < ActiveRecord::Migration
  def change
    add_column :listings, :listing_number, :string
    add_column :listings, :listing_owner, :string
  end
end
