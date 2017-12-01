renderCalendar = () => {
  const $calendar = $('#calendar');
  const events = JSON.parse($calendar.attr('data-events')).map(e => ({
    start: e.start_at,
    end: e.end_at + 'T23:59:59',
    title: e.description
  }));
  $calendar.fullCalendar({
    defaultView: 'basicWeek',
    height: 300,
    header: false,
    firstDay: 1,
    displayEventTime: false,
    events: events
    // # TODO: format columns title, remove header
  });
};

setupAjaxAddEventForm = () => {
  $("#add_event")
    .on("ajax:success", (_e, data) => {
      $('#calendar').fullCalendar(
        'addEventSource',
        [{
          start: data.start_at,
          end: data.end_at + 'T23:59:59',
          title: data.description,
        }]
      );
    }).on("ajax:error", (_e, xhr) => {
      alert(xhr.responseText);
    });
};

$(document).ready(() => {
  setupAjaxAddEventForm();
  renderCalendar();
});
