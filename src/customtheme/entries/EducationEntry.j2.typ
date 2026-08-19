#resume-quad-heading(
  [{{ entry.institution }}],
  [{{ entry.location }}
  {% if entry.date %}
    , {{ entry.date }}
  {% elif entry.start_date and entry.end_date %}
    , {{ entry.start_date }} – {{ entry.end_date }}
  {% elif entry.date_string %}
    , {{ entry.date_string }}
  {% endif %}
  ],
  [{{ entry.degree }}, {{ entry.area }}],
  [
    {% if entry.highlights %}
    {% for item in entry.highlights %}
    {{ item }}
    {% endfor %}
    {% endif %}
  ]
)