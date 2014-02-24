class AddIdsToNotes < ActiveRecord::Migration
  def change
    add_column :notes, :uid, :string, limit: 40
    add_column :notes, :lead_id, :integer
  end
end
