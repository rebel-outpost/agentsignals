class ChangeFieldsForListings < ActiveRecord::Migration
  def change
    change_column :listings, :price, :decimal, :precision => 8, :scale => 2
    add_column :listings, :description, :text
  end
end
