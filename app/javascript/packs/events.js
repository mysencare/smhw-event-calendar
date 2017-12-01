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

setupAjaxAddEventForm = () => {
  $("#add_event")
    .on("ajax:success", (e, data, status, xhr) => {
      $('#calendar').fullCalendar(
        'addEventSource',
        [{
          start: data.start_at,
          end: data.end_at,
          title: data.description,
        }]
      );
    }).on("ajax:error", (e, xhr, status, error) => {
      alert('ERR!'); // TODO!!!
    });
};

$(document).ready(() => {
  renderCalendar();
  setupAjaxAddEventForm();
});
