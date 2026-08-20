#block(
  below: 12pt,
  [
    #resume-trio-heading(
      [{{ entry.name }} {% if entry.project_url %}#h(0.5em)#link("{{ entry.project_url }}")[#fa-icon("external-link", size: 0.9em)] {% endif %}],
      [{{ entry.summary }}],
      [
        #set text(size: 0.9em)
        {% if entry.github_url %}#strong[\[#link("{{ entry.github_url }}")[#fa-icon("github", size: 0.9em) #h(1pt) GitHub]\]]{% endif %}
      ]
    )
    {% if entry.highlights %}
    #v(8.5pt)
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