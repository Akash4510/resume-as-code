#block(
  below: {{ design.sections.space_between_regular_entries }},
  [
    #list(
      marker: dot,
      spacing: 0pt,
      indent: 0in,
      body-indent: 0.5em,
      [#strong[{{ entry.label }}:] {{ entry.details }}]
    )
  ]
)