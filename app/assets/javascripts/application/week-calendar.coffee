class WeekCalendar
  constructor: (@root) ->
    console.log('WeekCalendar!')

$.fn.weekCalendar = ->
  @.each ->
    new WeekCalendar(@)

$ ->
  $('.week-calendar').weekCalendar()
