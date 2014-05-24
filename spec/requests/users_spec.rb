require 'spec_helper'

describe "User Dashboard" do

  before do
    @user    = create :user
    @lead    = create :lead, first_name: 'Bill', last_name: 'Gates', phone: '8885551212', lead_status: 'new', lead_source: 'web', lead_owner: @user.email
    @task    = create :task, lead_for_task: @lead.first_name, assigned_to: @user.email
    @account = create :account
    @account.users << @user
    login_as @user
  end

  it 'has user dashboard' do
    expect(page).to have_content "Welcome to your Dashboard"
  end

  it 'has quick links' do
    expect(page).to have_content 'Leads'
    expect(page).to have_content 'Clients'
    expect(page).to have_content 'Agents'
    expect(page).to have_content 'Listings'
    expect(page).to have_content 'Offers'
    expect(page).to have_content 'Opportunities'
  end

  it 'links to new lead' do
    click_link 'Leads'
    click_link 'New Lead'
    expect(page).to have_content 'New Lead'
  end

  it 'links to new task' do
    click_link 'Tasks'
    click_link 'Create Task'
    expect(page).to have_content 'Create New Task'
  end

  it 'links to new client' do
    click_link 'Clients'
    click_link 'New Client'
    expect(page).to have_content 'Add Client Contact Info'
  end

  it 'links to new opportunity' do
    click_link 'Opportunities'
    click_link 'New Opportunity'
    expect(page).to have_content 'Create New Opportunity'
  end

  it 'links to new offer' do
    click_link 'Offers'
    click_link 'New Offer'
    expect(page).to have_content 'New Offer'
  end

  it 'shows leads assigned' do
    expect(page).to have_content @lead.full_name
    expect(page).to have_content @lead.company
    expect(page).to have_content @lead.lead_status.to_s.capitalize
    expect(page).to have_content @lead.created_at.to_date
  end

  it 'shows tasks assigned' do
    expect(page).to have_content @task.name.titleize
    expect(page).to have_content @task.due_date
    expect(page).to have_content @task.task_type.titleize
    expect(page).to have_content @task.lead_for_task.titleize
  end

  it 'can create its profile' do
    visit edit_user_path(@user)
    fill_in 'user_first_name', with: 'Bill'
    fill_in 'user_last_name', with: 'Gates'
    fill_in 'user_phone', with: '8001231234'
    click_button 'Update'
    expect(page).to have_content 'User has been successfully updated'
  end


end
