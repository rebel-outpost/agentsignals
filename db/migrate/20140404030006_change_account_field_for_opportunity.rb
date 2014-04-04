class ChangeAccountFieldForOpportunity < ActiveRecord::Migration
  def change
    rename_column :opportunities, :account_name, :contact_person_name
  end
end
