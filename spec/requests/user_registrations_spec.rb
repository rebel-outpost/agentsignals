require 'spec_helper'

describe "User Registrations" do
  describe 'with free account' do

    it 'registers new user', js: true do
      visit root_path
      click_link 'Sign up'
      fill_in 'First name',             with: 'bill'
      fill_in 'Last name',              with: 'gates'
      fill_in 'Email',                  with: 'bill@example.com'
      fill_in 'Password',               with: 'password'
      fill_in 'Password confirmation',  with: 'password'
      click_button 'Sign up'
      page.should have_content 'Welcome! You have signed up successfully.'
      current_path.should == new_account_path
    end

    describe 'new account creation' do
      before do
        @user = create :user
      end

      it 'registers new account' do
        login_as @user
        current_path.should == new_account_path
        select "Basic",           from: "Plan type"
        fill_in 'Account name',   with: 'XYZ'
        fill_in 'Phone',          with: '800551212'
        fill_in 'Address',        with: '123 Sesame St'
        fill_in 'City',           with: 'New York'
        select 'NY',              from: "State"
        fill_in 'Zip',            with: '12345'
        click_button 'Create Account'
        page.should have_content 'Account successfully created'
        current_path.should == dashboard_path
      end

    end

  end
end
