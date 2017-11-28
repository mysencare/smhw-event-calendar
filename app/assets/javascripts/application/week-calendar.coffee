class WeekCalendar
  constructor: (@root) ->
    @$eventFormPopup = $('.week-calendar--event-popup', @root)
    @$eventItemsContainer = $('.week-calendar--table-content', @root)
    @initCreateButton()
    @initEventFormHandler()
    @initPopupCancelButton()
    @preventBadRangeDates()

  initCreateButton: =>
    $('.week-calendar--create-btn', @root).click =>
      @$eventFormPopup.show()

  initEventFormHandler: =>
    $('form', @$eventFormPopup)
      .on 'ajax:success', (e, data) =>
        @$eventItemsContainer.append(data.append_item)
        @$eventFormPopup.find('form').trigger('reset').end().hide()
      .on 'ajax:error', (e, xhr, status, error) =>
        data = xhr.responseJSON
        alert(data.message) if data?.message

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
