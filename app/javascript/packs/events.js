renderCalendar = () => {
  const $calendar = $('#calendar');
  const events = JSON.parse($calendar.attr('data-events')).map(e => ({
    start: e.start_at,
    end: e.end_at,
    title: e.description
  }));
  $calendar.fullCalendar({
    defaultView: 'basicWeek',
    height: 300,
    events: events
    // # TODO: format columns title, remove header
  });
};

$(document).ready(() => {
  renderCalendar();
});
