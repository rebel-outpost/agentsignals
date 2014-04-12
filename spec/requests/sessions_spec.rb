require 'spec_helper'

describe "Sessions" do
  before do
    @user   = create :user
    @account = create :account
    @account.users << @user
  end

  it 'logins in user' do
    visit root_path
    click_link 'Login'
    fill_in 'user_email', with: @user.email
    fill_in 'user_password', with: @user.password
    click_button 'Sign in'
    expect(page).to have_content "Welcome to your Dashboard"
  end

end
