#block(
  below: {{ design.sections.space_between_regular_entries }},
  [
    #set text(size: 0.9em)
    #list(
      marker: dot,
      spacing: 0pt,
      indent: 0in,
      body-indent: 0.5em,
      [#strong[{{ entry.label }}:] {{ entry.details }}]
    )
  ]
)