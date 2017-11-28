class WeekCalendar
  constructor: (@root) ->
    @$eventFormPopup = $('.week-calendar--event-popup', @root)
    @initCreateButton()
    @initEventFormHandler()
    @initPopupCancelButton()
    @preventBadRangeDates()

  initCreateButton: =>
    $('.week-calendar--create-btn', @root).click =>
      @$eventFormPopup.show()

  initEventFormHandler: =>
    $('form', @$eventFormPopup)
      .on 'ajax:success', =>
        console.log('success')
        @$eventFormPopup.hide()
      .on 'ajax:error', =>
        console.log('error')

  initPopupCancelButton: =>
    $('.week-calendar--popup-cancel-btn', @root).click =>
      @$eventFormPopup.find('form').trigger('reset').end().hide()

  preventBadRangeDates: =>
    $rangeFieldsWrap = $('.week-calendar--date-range-fields', @root)
    $inputStart = $rangeFieldsWrap.find('input').first()
    $inputEnd = $rangeFieldsWrap.find('input').last()

    $rangeFieldsWrap.on 'change', 'input', ->
      if $inputStart.val() > $inputEnd.val()
        t = $inputEnd.val()
        $inputEnd.val($inputStart.val())
        $inputStart.val(t)

$.fn.weekCalendar = ->
  @.each ->
    new WeekCalendar(@)

$ ->
  $('.week-calendar').weekCalendar()
