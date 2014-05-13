require 'spec_helper'

describe :listing do

  before do
    @user   = create :user
    @account = create :account
    @contact = create :contact, account: @account
    @account.users << @user
    login_as @user
  end

  it 'creates new listing' do
    click_link 'Listings'
    click_link 'Create Listing'
    fill_in 'Listing number',   with: '1'
    fill_in 'Title',            with: '3 BR 2 BA'
    fill_in 'Asking price',     with: "99,000"
    fill_in 'House number',     with: '123'
    fill_in 'Street name',      with: 'Sesame St.'
    fill_in 'City',             with: 'New York'
    select 'NY',                from: 'State'
    fill_in 'Zipcode',          with: '10001'
    select @contact.full_name,  from: 'Owners name'
    select @user.full_name,     from: 'Creating agent'
    within "#new_listing" do
      click_button 'Create Listing'
    end
    expect(page).to have_content'New Listing Created'
    expect(@account.listings.count).to eq(1)
  end

  context 'with created listing' do
    before do
      @listing = create :listing, listing_owner: @user
      visit listing_path(@listing)
    end

    it 'edits listing' do
      fill_in 'Asking price', with: "90000"
      click_button 'Update Listing'
      expect(page).to have_content'Listing successfully updated'
      @listing.reload
      expect(@listing.price).to eq(90000)
    end

    it 'lists all account listings'
    it 'does not list other account listings'

    it 'deletes a listing' do
      visit listings_path
      click_button 'Delete'
      page.driver.browser.switch_to.alert.accept
      expect(page).to have_content'Listing successfully deleted'
    end

  end
end