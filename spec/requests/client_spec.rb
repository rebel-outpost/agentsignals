require 'spec_helper'

describe 'Clients' do

  before do
    @user   = create :user
    @account = create :account
    @account.users << @user
    login_as @user
  end

  it 'creates a new client' do
    click_link 'Clients'
    click_link 'New Client'
    fill_in "client_first_name", with: 'Bob'
    fill_in "client_last_name",  with: 'Roberts'
    fill_in "client_company",    with: 'RebelHold'
    fill_in "client_email",      with: 'bob@rebelhold.com'
    fill_in "client_phone",      with: '480-555-1212'
    fill_in "client_address",    with: '123 Fake St. Fakerton, AZ 12345'
    click_button 'Create Client'
    expect(page).to have_content 'New Client Created'
    Client.count.should == 1
  end

  it 'has required client information' do
    click_link 'Clients'
    click_link 'New Client'
    fill_in "client_first_name", with: 'Bob'
    fill_in "client_company",    with: 'RebelHold'
    fill_in "client_email",      with: 'bob@rebelhold.com'
    fill_in "client_phone",      with: '480-555-1212'
    fill_in "client_address",    with: '123 Fake St. Fakerton, AZ 12345'
    click_button 'Create Client'
    page.should_not have_content 'New Client Created'
    Client.count.should == 0
  end

  context 'with existing client' do
    before do
      @client = create :client
      @user.clients << @client
    end

    it 'deletes client', js: true do
      visit clients_path
      click_link 'delete'
      page.driver.browser.switch_to.alert.accept
      expect(page).to have_content 'Client Deleted'
      Client.all.count.should == 0
    end

    it 'edits client', js: true do
      visit clients_path
      within '.table' do
        click_link 'edit'
      end
      fill_in "client_first_name", with: 'John'
      click_button 'Update Client'
      expect(page).to have_content 'Client Updated'
      @client.reload
      @client.first_name.should == 'John'
    end
  end

  context 'with multiple accounts' do
    before do
      @client = create :client
      @user.clients << @client
      @another_account = create :account
      @another_client = create :client, account: @another_account
    end

    it "should only show clients that belong to its account" do
      visit clients_path
      expect(page).to have_content @client.full_name
      page.should_not have_content @another_client.full_name
    end
  end
end