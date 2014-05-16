require 'spec_helper'

describe 'Tasks' do

  before do
    @user   = FactoryGirl.create :user
    @user2  = FactoryGirl.create :user, email: 'test2@example.com', first_name: 'Jim'
    @lead   = FactoryGirl.create :lead, email: 'test@test.com', first_name: 'Jenny', last_name: 'Smith'
    @account = FactoryGirl.create :account
    @account.users << @user
    @account.users << @user2
    login_as @user
  end

  it 'creates a new task', js:true do
    click_link 'Tasks'
    click_link 'Create Task'
    fill_in 'task_due_date',        with: '09/11/2012'
    select  "#{@user2.email}",       from: 'Assigned to'
    select  'Call',                  from: 'Type'
    select  "#{@lead.email}",        from: 'For Lead'
    fill_in "task_name",       with: 'test task'
    click_button 'Create Task'
    Task.count.should == 1
    expect(page).to have_content 'New Task Created'
  end

  it 'has required fields' do
    click_link 'Tasks'
    click_link 'Create Task'
    fill_in 'task_due_date',        with: '09/11/2012'
    select  "#{@user2.email}",       from: 'Assigned to'
    select  'Call',                  from: 'Type'
    select  "#{@lead.email}",        from: 'For Lead'
    click_button 'Create Task'
    Task.count.should == 0
    page.should_not have_content 'Task Updated'
  end

  it 'notifies the user they have been assigned to a task' do
    click_link 'Tasks'
    click_link 'Create Task'
    fill_in "task_name",       with: 'another test task'
    fill_in 'task_due_date',        with: '09/11/2012'
    select  "#{@user2.email}",       from: 'Assigned to'
    select  'Call',                  from: 'Type'
    select  "#{@lead.email}",        from: 'For Lead'
    sleep 2
    click_button 'Create Task'
    expect(page).to have_content 'New Task Created'
    ActionMailer::Base.deliveries.last.to.should include @user2.email
    ActionMailer::Base.deliveries.last.subject.should include 'A new task has been assigned to you on SimpleCRM'
  end

  context 'edit' do
    before do
      @task = create :task, lead_for_task: @lead.first_name, user: @user, assigned_to: @user.email
    end

    it 'edits task' do
      visit tasks_path
      within '.table' do
        click_link 'edit'
      end
      fill_in "task_name",         with: 'test task 2 updated'
      fill_in 'task_due_date',          with: '09/11/2012'
      select  "#{@user2.email}",         from: 'Assigned to'
      select  'Email',                   from: 'Type'
      select  "#{@lead.email}",          from: 'For Lead'
      sleep 2
      click_button 'Update Task'
      expect(page).to have_content 'Task Updated'
      @task.reload
      @task.name.should == 'test task 2 updated'
    end


    it 'notifies the user their task has changed' do
      visit tasks_path
      within '.table' do
        click_link 'edit'
      end
      fill_in "task_name",         with: 'test task 2 updated'
      fill_in 'task_due_date',          with: '09/11/2012'
      select  "#{@user2.email}",         from: 'Assigned to'
      select  'Email',                   from: 'Type'
      select  "#{@lead.email}",          from: 'For Lead'
      sleep 2
      click_button 'Update Task'
      ActionMailer::Base.deliveries.last.to.should include @user2.email
      ActionMailer::Base.deliveries.last.subject.should include 'A task you have been assigned to on SimpleCRM has been updated'
    end

  end

  context 'delete' do
    before do
      @task   = create :task, lead_for_task: @lead.first_name, user: @user, assigned_to: @user.email
    end

    it 'deletes task', js: true do
      visit tasks_path
      click_link 'delete'
      page.driver.browser.switch_to.alert.accept
      expect(page).to have_content 'Task Deleted'
    end

  end
end