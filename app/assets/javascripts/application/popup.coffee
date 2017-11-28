$ ->
  $('.popup--close').click ->
    $(@).closest('.popup--wrap').hide()

  $('.popup--wrap').click (e) ->
    if e.target == @
      $(@).hide()
