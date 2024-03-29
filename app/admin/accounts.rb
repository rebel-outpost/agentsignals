ActiveAdmin.register Account do
  index do
    column :subscription_plan
    column :name
    column :phone
    column :address
    column :city
    column :state
    column :zip
    column :max_users

    # default_actions
  end

  filter :name

  form do |f|
    f.inputs "Account Details" do
      f.input :subscription_plan
      f.input :name
      f.input :phone
      f.input :address
      f.input :city
      f.input :state
      f.input :zip
      f.input :max_users

    end
    f.actions
  end
end
