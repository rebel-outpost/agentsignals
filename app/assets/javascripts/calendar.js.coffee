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

    eventResize: (event, dayDelta, minuteDelta, revertFunc) ->


    eventClick: (event, jsEvent, view) ->
      $.ajax
        dataType: "script"
        url: "/events/" + event.id

    eventMouseover: (event, jsEvent, view) -> 

    select: (start, end, allDay) ->
