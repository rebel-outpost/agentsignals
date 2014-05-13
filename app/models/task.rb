class Task < Event

  validates_presence_of :task_type, :name, :assigned_to, :due_date, :lead_for_task

  DUE_DATES = [['Overdue','overdue'],['Asap', 'asap'],['Today', 'today'],['Tomorrow', 'tomorrow'],['This week', 'this_week'],['Next week','next_week'],['Sometime later','sometime_later']]
  TASK_TYPES = [['Call','call'],['Email', 'email']]

  class << self
    def due_dates
      DUE_DATES
    end

    def task_type
      TASK_TYPES
    end
  end

end
