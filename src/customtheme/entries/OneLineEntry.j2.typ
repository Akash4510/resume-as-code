#list(
  marker: dot,
  spacing: {{ design.sections.space_between_regular_entries }},
  indent: 0in,
  body-indent: 0.5em,
  [#strong[{{ entry.label }}:] {{ entry.details }}]
)
#v({{ design.sections.space_between_regular_entries }})