require 'spec_helper'

describe "Opportunities" do

  before do
    @user           = create :user
    @contact        = create :contact
    @account        = create :account
    @account.users << @user
    @account.contacts << @contact
    login_as @user
  end

  it 'creates an opportunity' do
    click_link 'Opportunities'
    click_link 'Create Opportunity'
    fill_in 'opportunity_opportunity_name',   with: 'Next Big Deal'
    select @contact.full_name, 					      from: 'Contact name'
    select 'New Customer', 					          from: 'Opportunity type'
    fill_in 'opportunity_amount', 	          with: '10,000'
    select 'Proposal', 							          from: 'Stage'
    select "#{@user.email}",				          from: 'Owner'
    fill_in 'opportunity_closing_date',       with: '09/11/2012'
    fill_in 'opportunity_probability', 	      with: '50%'
    fill_in 'opportunity_contact_person_name',	      with: 'Mister Smith'
    fill_in 'opportunity_comments', 		      with: 'Lets nail this one'
    click_button 'Create Opportunity'
    expect(page).to have_content 'New Opportunity Created'
  end

  context 'with created opportunity' do

    before do
      @opportunity = create :opportunity, owner: @user.email, account: @account, contact_name: @contact.full_name
    end

    it 'edits opportunity' do
      visit opportunities_path
      within '.table' do
        click_link 'edit'
      end

      fill_in 'opportunity_opportunity_name',   with: 'New Deal Name'
      fill_in 'opportunity_amount',             with: '20,000'
      click_button 'Update Opportunity'
      expect(page).to have_content 'Opportunity Successfully Updated'
    end

    it 'deletes an opportunity', js: true do
      visit opportunities_path
      click_link 'delete'
      page.driver.browser.switch_to.alert.accept
      expect(page).to have_content 'Opportunity Deleted'
    end

    it "should only show opportunities that belong to its account" do
      @user2           = build :user
      @account2        = build :account
      @contact         = build :contact
      @account2.users << @user2
      @opportunity2 = build :opportunity, owner: @user2.email, contact_name: @contact.full_name, account: @account2
      visit opportunities_path
      expect(page).to have_content @opportunity.opportunity_name
      expect(page).to_not have_content @opportunity2.opportunity_name
    end
  end


end