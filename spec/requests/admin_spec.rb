require 'spec_helper'

describe "Admin" do
  before do
    @admin_user = AdminUser.create(email: 'testadmin@example.com', password: 'password')
  end

  it 'logs in admin user' do
    visit new_admin_user_session_path
    fill_in 'Email', with: @admin_user.email
    fill_in 'Password', with: @admin_user.password
    click_button 'Login'
    current_path.should == admin_dashboard_path
  end

  describe 'while logged in' do
    before do
      login_admin @admin_user
    end

    # TODO Make the plan a selection
    it 'creates an account' do
      click_link 'Accounts'
      click_link 'New Account'
      fill_in 'Name', with: 'New Account'
      fill_in 'Phone', with: '8005551212'
      fill_in 'Max users', with: 5
      fill_in "Subscription plan", with: 1
      click_button 'Create Account'
      expect(page).to have_content 'Account was successfully created.'
    end

    # TODO Make the role a selection
    it 'creates an account admin' do
      @account = create :account
      click_link 'Users'
      click_link 'New User'
      fill_in 'Email', with: 'newadmin@example.com'
      fill_in 'Password', with: 'password'
      fill_in 'Password confirmation', with: 'password'
      fill_in 'First name', with: 'New'
      fill_in 'Last name', with: 'Admin'
      select @account.name, from: 'Account'
      fill_in 'Phone', with: '9991231234'
      fill_in 'Account role', with: 'Admin'
      click_button 'Create User'
      expect(page).to have_content 'User was successfully created.'
    end

    it 'cancels account' do
      pending "new-test"
      @account2 = create :account
      click_link 'Accounts'
      select 'Inactive', from: 'Account Status'
      expect(@acount2.status).to eq('inactive')
    end

    it 'bans user' do
      pending "new-test"
      @account2 = create :account
      @user     =  create :user, account: @account2
      click_link 'Users'
      click_link @user.full_name
      click_button 'Delete User'
      expect(@account2.users).to_not include(@user)
    end

  end
end