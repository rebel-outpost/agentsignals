class UserMailer < ActionMailer::Base
  default from: 'no-reply@simplecrm.us'

  def reset_password(user)
    @user = user
    mail(to: @user.email, subject: 'Password Reset')
  end

  def notify_approval(user)
    @user = user
    mail(to: @user.email, subject: 'SimpleCRM Approval')
  end

end
