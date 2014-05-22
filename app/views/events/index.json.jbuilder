json.array! @events do |event|
  json.id(event.id)
  json.title(event.name)
  json.start(event.due_date)
  json.end(event.ends)
  json.allDay(event.all_day)
  json.type(event.type)
  if event.type == "Task"
    json.backgroundColor(@user.task_color)
    json.borderColor(@user.task_color)
  elsif event.type == "Appointment"
    json.backgroundColor(@user.appointment_color)
    json.borderColor(@user.appointment_color)
  elsif event.type == "Showing"
    json.backgroundColor(@user.showing_color)
    json.borderColor(@user.showing_color)
  end

end