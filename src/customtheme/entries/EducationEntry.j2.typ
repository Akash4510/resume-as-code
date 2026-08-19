#resume-quad-heading(
  [{{ entry.institution }}],
  [{{ entry.location }}, {{ entry.date_string }}],
  [{{ entry.degree }}, {{ entry.area }}],
  [
    {% if entry.highlights %}
    {% for item in entry.highlights %}
    {{ item }}
    {% endfor %}
    {% endif %}
  ]
)