#block(
   below: 14pt,
  [
    #resume-quad-heading(
      [{{ entry.company }}],
      [
        {% if entry.date %}
          {{ entry.date }}
        {% elif entry.start_date and entry.end_date %}
          {{ entry.start_date }} – {{ entry.end_date }}
        {% elif entry.date_string %}
          {{ entry.date_string }}
        {% endif %}
      ],
      [{{ entry.position }}],
      [{{ entry.location }}]
    )
    #v(10pt)
    {% if entry.highlights %}
    #highlights(
      {% for item in entry.highlights %}
      [
        #set text(size: 0.9em)
        {{ item }}
      ],
      {% endfor %}
    )
    {% endif %}
  ]
)