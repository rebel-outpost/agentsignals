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


  def flash_class(level)
    case level.to_sym
      when :notice then "alert alert-success"
      when :success then "alert alert-success"
      when :error then "alert alert-danger"
      when :alert then "alert alert-danger"
    end
  end
    
end
