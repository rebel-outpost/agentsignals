module TasksHelper

  def task_type_options
    [
      ['Call','call'], 
      ['Email','email'], 
      ['Follow-up', 'followup'], 
      ['Meeting', 'meeting']
    ]
  end

end