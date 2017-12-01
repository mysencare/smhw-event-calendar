renderViewColumns = (view, element) => {
  element.find('th.fc-day-header.fc-widget-header').each(function () {
    const date = moment($(this).data('date'));
    $(this).html('<strong>' + date.format('dddd') + '</strong><br><span>' + date.format('Do MMM') + '</span>');
  })
};

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
    columnFormat: "dddd\nDo MMM",
    viewRender: renderViewColumns,
    displayEventTime: false,
    events: events
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
