require 'spec_helper'

describe 'Contact requests' do

  before do
    @user   = FactoryGirl.create :user
    @organization = FactoryGirl.create :organization
    @organization.users << @user
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
    page.should have_content 'New Contact Created'
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
      @contact = FactoryGirl.create :contact, organization: @organization
    end

    it 'deletes contact' do
      visit contacts_path
      click_link 'delete'
      page.driver.browser.switch_to.alert.accept
      page.should have_content 'Contact Deleted'
      Contact.all.count.should == 0
    end

    it 'edits contact' do
      visit contacts_path
      within '.table' do
        click_link 'edit'
      end
      fill_in "contact_first_name", with: 'John'
      click_button 'Update Contact'
      page.should have_content 'Contact Updated'
      @contact.reload
      @contact.first_name.should == 'John'
    end
  end

  context 'with multiple organizations' do
    before do
      @contact = FactoryGirl.create :contact, organization: @organization
      @another_organization = FactoryGirl.create :organization
      @another_contact = FactoryGirl.create :contact, organization: @another_organization
    end

    it "should only show contacts that belong to its organization" do
      visit contacts_path
      page.should have_content @contact.email
      page.should_not have_content @another_contact.email
    end
  end
end