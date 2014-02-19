class CreateOrganizations < ActiveRecord::Migration
  def change
    create_table :organizations do |t|
      t.string :name, null: false
      t.string :phone, null: false
      t.string :address
      t.string :city
      t.string :state
      t.string :zip
      t.integer :max_users, default: 1, null: false
      t.timestamps
    end
  end
end
