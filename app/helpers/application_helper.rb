module ApplicationHelper

  def background_options
    [
      ['default', 'default-background'], 
      ['default-inverse', 'default-inverse-background'],
      ['medium', 'medium-background'], 
      ['dark', 'dark-background']
    ]
  end

  def background
    if current_user
      current_user.background
    else
      "default-background"
    end
  end
  
end
