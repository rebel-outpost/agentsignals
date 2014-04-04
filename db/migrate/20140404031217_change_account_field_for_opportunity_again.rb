class ChangeAccountFieldForOpportunityAgain < ActiveRecord::Migration
  def change
    change_column_null :opportunities, :contact_name, false
    change_column_null :opportunities, :contact_person_name, true
  end
end
