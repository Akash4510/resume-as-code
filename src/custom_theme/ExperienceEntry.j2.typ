#resume-quad-heading(
  [<< entry.company >>],
  [<< entry.date_string >>],
  [<< entry.position >>],
  [<< entry.location >>]
)
#v(10pt)
((* if entry.highlights *))
#highlights(
  ((* for item in entry.highlights *))
  [<< item >>],
  ((* endfor *))
)
#v(6pt)
((* endif *))