require 'spec_helper'

describe "Opportunities" do

  before do
    @user           = create :user
    @organization   = create :organization
    @account        = create :account, organization: @organization
    @organization.users << @user
    login_as @user
  end

  it 'creates an opportunity' do
    click_link 'Opportunities'
    click_link 'Create Opportunity'
    fill_in 'opportunity_opportunity_name',   with: 'Next Big Deal'
    select @account.name, 					          from: 'Account name'
    select 'New Customer', 					          from: 'Opportunity type'
    fill_in 'opportunity_amount', 	          with: '10,000'
    select 'Proposal', 							          from: 'Stage'
    select "#{@user.email}",				          from: 'Owner'
    fill_in 'opportunity_closing_date',       with: '09/11/2012'
    fill_in 'opportunity_probability', 	      with: '50%'
    fill_in 'opportunity_contact_name',	      with: 'Mister Smith'
    fill_in 'opportunity_comments', 		      with: 'Lets nail this one'
    click_button 'Create Opportunity'
    expect(page).to have_content 'New Opportunity Created'
  end

  context 'with created opportunity' do

    before do
      @opportunity = create :opportunity, owner: @user.email, account_name: @account.name, organization: @organization
    end

    it 'edits opportunity' do
      visit opportunities_path
      within '.table' do
        click_link 'edit'
      end

      fill_in 'opportunity_opportunity_name',   with: 'New Deal Name'
      fill_in 'opportunity_amount',             with: '20,000'
      click_button 'Update'
      expect(page).to have_content 'Opportunity Successfully Updated'
    end

    it 'deletes an opportunity', js: true do
      visit opportunities_path
      click_link 'delete'
      page.driver.browser.switch_to.alert.accept
      expect(page).to have_content 'Opportunity Deleted'
    end

    it "should only show opportunities that belong to its organization" do
      @user2           = build :user
      @organization2   = build :organization
      @account2        = build :account, organization: @organization
      @organization2.users << @user2
      @opportunity2 = build :opportunity, owner: @user2.email, account_name: @account2.name, organization: @organization2
      visit opportunities_path
      expect(page).to have_content @opportunity.opportunity_name
      expect(page).to_not have_content @opportunity2.opportunity_name
    end
  end


end