require 'spec_helper'

describe "Leads" do

  before do
    @user   = create :user
    @user2  = create :user, first_name: 'Jim Jones'
    @user3  = create :user, first_name: 'Jim Jones II'
    @account = create :account
    @account.users << @user
    @account.users << @user2
    login_as @user
  end

  it 'should create new lead' do
    click_link 'Leads'
    click_link 'Create Lead'
    current_path.should == new_lead_path
    fill_in 'lead_first_name',  with: 'Bill'
    fill_in 'lead_last_name',   with: 'Gates'
    fill_in 'lead_phone',       with: '8005551212'
    fill_in 'lead_email',       with: 'bill@ms.com'
    fill_in 'lead_comments',    with: 'Needs ASAP'
    select  "#{@user2.email}",  from: 'Lead owner'
    select 'Buyer',             from: 'Lead type'
    select 'New',               from: 'Lead status'
    select 'Web Lead',          from: 'Lead source'
    sleep 1
    click_button 'Create Lead'
    Lead.last.last_name.should == 'Gates'
    expect(page).to have_content'New Lead Created'
  end

  it 'adds new lead to account on creation' do
    click_link 'Leads'
    click_link 'Create Lead'
    current_path.should == new_lead_path

    fill_in 'lead_first_name',  with: 'Billy'
    fill_in 'lead_last_name',   with: 'Goats'
    fill_in 'lead_phone',       with: '8005551212'
    fill_in 'lead_email',       with: 'bill@ms.com'
    fill_in 'lead_comments',    with: 'Needs ASAP'
    select  "#{@user2.email}",  from: 'Lead owner'
    select  'Buyer',            from: 'Lead type'
    select  'New',              from: 'Lead status'
    select  'Web Lead',         from: 'Lead source'
    sleep 1
    click_button 'Create Lead'
    Lead.last.last_name.should == 'Goats'
    expect(page).to have_content'New Lead Created'
    @account.leads.last.should == Lead.last
  end

  it 'notifies new lead create' do
    click_link 'Leads'
    click_link 'Create Lead'

    fill_in 'lead_first_name',  with: 'Bill'
    fill_in 'lead_last_name',   with: 'Gates'
    fill_in 'lead_phone',       with: '8005551212'
    fill_in 'lead_email',       with: 'bill2@ms.com'
    fill_in 'lead_comments',    with: 'Needs ASAP'
    select  "#{@user2.email}",  from: 'Lead owner'
    select  'Buyer',            from: 'Lead type'
    select  'New',              from: 'Lead status'
    select  'Web Lead',         from: 'Lead source'
    sleep 1
    click_button 'Create Lead'
    ActionMailer::Base.deliveries.last.to.should include @user2.email
    ActionMailer::Base.deliveries.last.body.should include 'new lead'
  end

  context 'with created lead' do

    before do
      @lead   = create :lead, first_name: 'Bill', last_name: 'Gates', phone: '8885551212', lead_status: 'new', lead_source: 'web', lead_owner: @user.email, account: @account
      @lead2  = create :lead, first_name: 'Bob', last_name: 'Marley', phone: '8005551212', lead_status: 'contacted', lead_owner: @user3.email, lead_source: 'referral', email: 'bob@marley.com'
    end

    it 'should edit a lead' do
      visit lead_path @lead
      select  'Contacted', from: 'Lead status'
      sleep 2
      click_button 'Update'
      expect(page).to have_content'Lead Updated'
    end

    it 'should show all leads belonging to account' do
      visit leads_path
      expect(page).to have_content'Bill Gates'
      page.should_not have_content 'Bob Marley'
    end

    it 'assigns lead to user' do
      visit lead_path @lead
      select  "#{@user2.email}", from: 'Lead owner'
      sleep 2
      click_button 'Update'
      expect(page).to have_content'Lead Updated'
      visit leads_path
      expect(page).to have_content@user2.email
    end

    it 'reassigns lead' do
      visit lead_path @lead
      select  "#{@user.email}", from: 'Lead owner'
      sleep 2
      click_button 'Update'
      expect(page).to have_content'Lead Updated'
      visit leads_path
      expect(page).to have_content@user.email
    end

    it 'deletes a lead', js: true do
      visit leads_path
      expect(page).to have_content'Bill Gates'
      click_link 'delete'
      page.driver.browser.switch_to.alert.accept
      expect(page).to have_content'Lead Deleted'
      page.should_not have_content 'Bill Gates'
    end

    it 'creates a note' do
      visit lead_path @lead
      fill_in 'Content', with: 'this is a note'
      select "Follow Up", from: "Note type"
      fill_in 'Due date', with: '12/25/2012'
      click_button 'Add new Note'
      expect(page).to have_content'Note was successfully created'
      expect(page).to have_content'this is a note'
    end

    it 'converts a lead' do
      visit lead_path @lead
      click_link 'Convert Lead'
      select  "#{@account.name}", from: 'Account name'
      fill_in 'Opportunity name', with: 'New Opportunity'
      select  "#{@user.email}", from: 'Opportunity owner'
      count_before = Opportunity.count
      sleep 2
      click_button 'Convert'
      Opportunity.count.should == count_before + 1
      Opportunity.last.opportunity_name.should == 'New Opportunity'
      expect(page).to have_content'Lead has been converted'
    end
  end

  context 'web-to-lead' do
    it 'creates web-to-lead form' do
      visit web_to_lead_path
      fill_in 'redirect_url',   with: '/index.html'
      check 'first_name'
      check 'last_name'
      check 'company'
      check 'email'
      check 'phone'
      check 'address'
      check 'city'
      check 'state'
      check 'zip'
      check 'comments'
      click_button 'Create Form'
      expect(page).to have_content'Copy the form below and use it anywhere in your website.'
    end
  end

end
