$ ->

  $('#add-user-to-account').click (e) ->
    e.preventDefault()
    $(this).parent().siblings('.new-user-add-form').slideToggle()
