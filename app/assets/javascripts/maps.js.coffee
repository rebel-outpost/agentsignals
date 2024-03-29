@buildMap = (markers) ->
  handler = Gmaps.build 'Google'
  handler.buildMap { provider: {}, internal: {id: 'listings-map'} }, ->
    markers = handler.addMarkers(markers)
    handler.bounds.extendWith(markers)
    handler.fitMapToBounds()


@buildShowMap = (markers) ->
  handler = Gmaps.build 'Google'
  handler.buildMap { provider: {}, internal: {id: 'single-listing-map'} }, ->
    markers = handler.addMarkers(markers)
    handler.bounds.extendWith(markers)
    handler.fitMapToBounds()
    handler.getMap().setZoom(13)

$ ->
  $("#display-map").click (e) ->
    e.preventDefault()
    $("body").find("#listings-map").slideToggle()

  $("#search-listings-button").click (e) ->
    e.preventDefault()
    $("body").find("#search-listings").slideToggle()