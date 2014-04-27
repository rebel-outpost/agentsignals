$ -> 

  date = new Date()
  d = date.getDate()
  m = date.getMonth()
  y = date.getFullYear()

  $("#full-calendar").fullCalendar
    editable: true
    selectHelper: true
    selectable: true
    header:
      left: "prev,next today"
      center: "title"
      right: "month,agendaWeek,agendaDay"

    defaultView: "month"
    slotMinutes: 15
    loading: (bool) ->
      if bool
        $("#loading").show()
      else
        $("#loading").hide()
      return

    eventSources: [
      url: "/events.json"
      cache: true
    ]
    timeFormat:
      month: 'h:mmt {- h:mmt}'
      agendaWeek: "h:mmt {- h:mmt}"
      agendaDay: "h:mmt {- h:mmt}"

    dragOpacity: "0.5"

    eventDrop: (event, dayDelta, minuteDelta, allDay, revertFunc) ->
      updateEvent(event)

    eventResize: (event, dayDelta, minuteDelta, revertFunc) ->
      revertFunc()

    eventClick: (event, jsEvent, view) ->
      $.ajax
        dataType: "script"
        url: "/events/" + event.id

    eventMouseover: (event, jsEvent, view) -> 

    select: (start, end, allDay) ->


  updateEvent = (event) ->
    start = $.fullCalendar.formatDate(event.start, "MMM dd yyyy h:mm tt u")
    end = $.fullCalendar.formatDate(event.end, "MMM dd yyyy h:mm tt u")
    $.ajax
      type: "PUT"
      url: "/events/" + event.id
      dataType: "json"
      data:
        event:
          name: event.title
          due_date: start
          ends_at: end
          type: event.type




