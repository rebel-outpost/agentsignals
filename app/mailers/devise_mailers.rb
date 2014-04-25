class DeviseMailers < Devise::Mailer   
  helper :application 
  include Devise::Controllers::UrlHelpers

  layout 'emails'

  def confirmation_instructions(record, token, opts={})
    attachments.inline['logo.png'] = File.read(File.join(Rails.root,"app","assets","images",'agentsignals.png'))
    super
  end

  def reset_password_instructions(record, token, opts={})
    attachments.inline['logo.png'] = File.read(File.join(Rails.root,"app","assets","images",'agentsignals.png'))
    super
  end

  def unlock_instructions(record, token, opt={})
    attachments.inline['logo.png'] = File.read(File.join(Rails.root,"app","assets","images",'agentsignals.png'))
    super
  end

end