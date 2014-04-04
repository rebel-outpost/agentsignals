require 'spec_helper'

describe 'Contact requests' do

  before do
    @user   = create :user
    @account = create :account
    @account.users << @user
    login_as @user
  end

  it 'creates a new contact' do
    click_link 'Contacts'
    click_link 'Create Contact'
    fill_in "contact_first_name", with: 'Bob'
    fill_in "contact_last_name",  with: 'Roberts'
    fill_in "contact_company",    with: 'RebelHold'
    fill_in "contact_email",      with: 'bob@rebelhold.com'
    fill_in "contact_phone",      with: '480-555-1212'
    fill_in "contact_address",    with: '123 Fake St. Fakerton, AZ 12345'
    click_button 'Create Contact'
    expect(page).to have_content 'New Contact Created'
    Contact.count.should == 1
  end

  it 'has required contact information' do
    click_link 'Contacts'
    click_link 'Create Contact'
    fill_in "contact_first_name", with: 'Bob'
    fill_in "contact_company",    with: 'RebelHold'
    fill_in "contact_email",      with: 'bob@rebelhold.com'
    fill_in "contact_phone",      with: '480-555-1212'
    fill_in "contact_address",    with: '123 Fake St. Fakerton, AZ 12345'
    click_button 'Create Contact'
    page.should_not have_content 'New Contact Created'
    Contact.count.should == 0
  end

  context 'with existing contact' do
    before do
      @contact = create :contact, account: @account
    end

    it 'deletes contact', js: true do
      visit contacts_path
      click_link 'delete'
      page.driver.browser.switch_to.alert.accept
      expect(page).to have_content 'Contact Deleted'
      Contact.all.count.should == 0
    end

    it 'edits contact' do
      visit contacts_path
      within '.table' do
        click_link 'edit'
      end
      fill_in "contact_first_name", with: 'John'
      click_button 'Update Contact'
      expect(page).to have_content 'Contact Updated'
      @contact.reload
      @contact.first_name.should == 'John'
    end
  end

  context 'with multiple accounts' do
    before do
      @contact = create :contact, account: @account
      @another_account = create :account
      @another_contact = create :contact, account: @another_account
    end

    it "should only show contacts that belong to its account" do
      visit contacts_path
      expect(page).to have_content @contact.email
      page.should_not have_content @another_contact.email
    end
  end
end