class Task < Event

  validates_presence_of :name, :due_date#, :lead_for_task, :task_type, :assigned_to

  DUE_DATES = [['Overdue','overdue'],['Asap', 'asap'],['Today', 'today'],['Tomorrow', 'tomorrow'],['This week', 'this_week'],['Next week','next_week'],['Sometime later','sometime_later']]
  TASK_TYPES = [['Call','call'],['Email', 'email']]

  def due_dates
    DUE_DATES
  end

  def task_type
    TASK_TYPES
  end


end
