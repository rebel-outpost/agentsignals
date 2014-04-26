json.array! @events do |event|
  json.id(event.id)
  json.title(event.name)
  json.start(event.due_date)
  json.type(event.class.name)
end