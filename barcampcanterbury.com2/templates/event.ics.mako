<%
    import datetime
    event = events[0]
    event_datetime = datetime.datetime.fromisoformat(event.isodatetime)
    date_format = '%Y%m%dT%H%M%S%z'
    dtstart = event_datetime.strftime(date_format)
    dtend = (event_datetime + datetime.timedelta(hours=6)).strftime(date_format)
%>BEGIN:VCALENDAR
VERSION:2.0
PRODID:-//none//NONSGML none//EN
BEGIN:VEVENT
UID:version1-${event_datetime.strftime('%m/%d/%y')}@${host}
DTSTAMP:${dtstart}
ORGANIZER;CN=${title}:MAILTO:${email}
DTSTART:${dtstart}
DTEND:${dtend}
SUMMARY:${title} ${event_datetime.strftime('%Y')}
GEO:${event.venue.geo.lat};${event.venue.geo.lon}
END:VEVENT
END:VCALENDAR
