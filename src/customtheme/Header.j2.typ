#grid(
  columns: (1fr, auto),
  align: (left + bottom, right + bottom),
  row-gutter: 1em,
  [
    #text(size: 24pt, weight: 700, [{{ cv.name }}])
  ],
  [
    #fa-icon("location-dot", size: 0.9em) #h(2pt) #text(size: 1em, weight: 400, [{{ cv.location }}])
  ],
  [
    #set text(size: 1em)
    {% if cv.website %}
    #link("{{ cv.website }}")[#fa-icon("globe", size: 0.9em) #h(1pt) {{ cv.website|replace("https://", "")|replace("http://", "")|replace("/", "") }}] |
    {% endif %}
    {% for network in cv.social_networks %}
    {% if network.network == "LinkedIn" %}
    #link("{{ network.url }}")[#fa-icon("linkedin", size: 0.9em) #h(1pt) LinkedIn] |
    {% elif network.network == "GitHub" %}
    #link("{{ network.url }}")[#fa-icon("github", size: 0.9em) #h(1pt) GitHub] |
    {% elif network.network == "Leetcode" %}
    #link("{{ network.url }}")[Leetcode]{% if not loop.last %} |{% endif %}
    {% else %}
    #link("{{ network.url }}")[{{ network.network }}]{% if not loop.last %} |{% endif %}
    {% endif %}
    {% endfor %}
  ],
  [
    {% if cv.email %}
    #fa-icon("envelope", size: 0.9em) #h(2pt) #link("mailto:{{ cv.email }}")[{{ cv.email|replace("@", "\\@") }}] |
    {% endif %}
    {% if cv.phone %}
    #fa-icon("phone", size: 0.9em) #h(2pt) #link("tel:{{ cv.phone|replace('tel:', '')|replace('(tel)', '')|replace(' ', '') }}")[{{ cv.phone|replace("tel:", "")|replace("(tel)", "") }}]
    {% endif %}
  ]
)

#v(10pt)
#box(width: 100%, height: 0.5pt, fill: black)