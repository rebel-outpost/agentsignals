class CreateAccounts < ActiveRecord::Migration
  def change
    create_table :accounts do |t|
      t.string :name, unique: true, null: false
      t.string :email
      t.string :assigned_to
      t.string :website
      t.string :phone
      t.string :address
      t.string :city
      t.string :state
      t.string :zip
      t.timestamps
    end
  end
end
