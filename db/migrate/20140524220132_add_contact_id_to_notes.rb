class AddContactIdToNotes < ActiveRecord::Migration
  def change
    add_column :notes, :contact_id, :integer
  end
end
