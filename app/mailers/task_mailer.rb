class TaskMailer < ActionMailer::Base
  default from: 'no-reply@simplecrm.us'

  def notify_new_task(user, task)
    @user = user
    @task = task
    mail(to: @user.email, subject: 'A new task has been assigned to you on SimpleCRM')
  end

  def notify_updated_task(user, task)
    @user = user
    @task = task
    mail(to: @user.email, subject: 'A task you have been assigned to on SimpleCRM has been updated')
  end
end
