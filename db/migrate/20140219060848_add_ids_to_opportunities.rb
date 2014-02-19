class AddIdsToOpportunities < ActiveRecord::Migration
  def change
    add_column :opportunities, :uid, :string, limit: 40
    add_column :opportunities, :organization_id, :integer
  end
end
