class CreateListings < ActiveRecord::Migration
  def change
    create_table :listings do |t|
      t.string :title
      t.decimal :price
      t.integer :house_number
      t.string :street_name
      t.string :city_name
      t.string :zipcode

      t.timestamps
    end

    add_index :listings, :zipcode
    add_index :listings, :price
  end
end
