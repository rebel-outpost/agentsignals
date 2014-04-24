json.array! @events do |event|
  json.id(event.id)
  json.title(event.task_name)
  json.start(event.due_date)
end