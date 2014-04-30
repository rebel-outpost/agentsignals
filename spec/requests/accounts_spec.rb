require 'spec_helper'

describe "Accounts" do
    describe "Account Admin" do
      describe 'with free account' do
        before do
          @account = create :account
          @admin_user = create :account_admin, account: @account
          login_as @admin_user
        end

        it 'has account dashboard' do
          click_link 'Account Settings'
          expect(page).to have_content("#{@account.name} Settings")
        end

        it "can edit account settings" do
          click_link 'Account Settings'
          fill_in 'Phone', with: '8885551111'
          click_button 'Update Account'
          expect(page).to have_content 'Successfully updated your account'
        end

      end

      describe 'with paid account' do
        before do
          @account = create :account, max_users: 3
          @admin_user = create :account_admin, account: @account
          login_as @admin_user
          visit settings_account_path(@account)
        end

        it "can add new user" do
          click_link 'Add a User'
          fill_in 'First name',             with: 'Bill'
          fill_in 'Last name',              with: 'Gates'
          fill_in 'Email',                  with: 'bill@bill.com'
          fill_in 'Password',               with: 'temppassword'
          fill_in 'Password confirmation',  with: 'temppassword'
          click_button 'Add User'
          expect(page).to have_content 'User successfully added'
          #one for admin and one for user
          expect(@account.users.count).to eq(2)
        end

        it 'lists existing users' do
          #new-test
          @user1 = create :user, account: @account
          expect(page).to have_content(@user1.full_name)
          expect(page).to have_content(@user1.email)
        end

        it "cannot add more than max allowed users" do
          #new-test
          expect(@account.users.count).to eq(3)
          click_link 'Add a User'
          fill_in 'First name',             with: 'Bill'
          fill_in 'Last name',              with: 'Gates'
          fill_in 'Email',                  with: 'bill@bill.com'
          fill_in 'Password',               with: 'temppassword'
          fill_in 'Password confirmation',  with: 'temppassword'
          click_button 'Add User'
          expect(page).to have_content 'You already have the max number of users for your subscription'
          expect(page).to_not have_content 'User successfully added'
        end
      end

    end
end
