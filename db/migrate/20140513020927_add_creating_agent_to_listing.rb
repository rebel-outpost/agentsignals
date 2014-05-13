class AddCreatingAgentToListing < ActiveRecord::Migration
  def change
    add_column :listings, :creating_agent, :string
  end
end
