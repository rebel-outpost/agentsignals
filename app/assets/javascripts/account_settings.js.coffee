$ ->

  $('#add-user-to-account').click (e) ->
    e.preventDefault()
    $(this).parent().siblings('.new-user-add-form').slideToggle()


  $('.background-picker').change ->
    background = this.value
    $('body').removeClass()
    $('body').addClass(background)
