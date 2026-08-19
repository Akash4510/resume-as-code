#import "@preview/fontawesome:0.5.0": fa-icon

#let name = "{{ cv.name }}"
#let locale-catalog-language = "{{ locale.language_iso_639_1 }}"
#let design-page-size = "{{ design.page.size }}"
#let design-colors-text = {{ design.colors.body.as_rgb() }}
#let design-text-font-size = {{ design.typography.font_size.body }}
#let design-text-leading = {{ design.typography.line_spacing }}
#let design-text-font-family = "{{ design.typography.font_family.body }}"
#let design-entries-vertical-space-between-entries = {{ design.sections.space_between_regular_entries }}
#let design-highlights-top-margin = {{ design.entries.highlights.space_above }}

// Metadata:
#set document(author: name, title: name + "'s CV")

// Page settings:
#set page(
  margin: (
    top: {{ design.page.top_margin }},
    bottom: {{ design.page.bottom_margin }},
    left: {{ design.page.left_margin }},
    right: {{ design.page.right_margin }},
  ),
  paper: design-page-size,
)

// Text settings:
#set text(
  font: design-text-font-family,
  size: design-text-font-size,
  lang: locale-catalog-language,
  fill: design-colors-text,
  ligatures: true,
)
#set par(
  spacing: 0pt,
  leading: design-text-leading,
  justify: false,
)

// List
#let dot = text(size: 1em, weight: 900, [•])

// Highlights settings:
#let highlights(..content) = {
  list(
    ..content,
    marker: dot,
    spacing: design-entries-vertical-space-between-entries,
    indent: 0.1in,
    body-indent: 0.5em,
  )
}

#set list(
  marker: dot,
  spacing: design-entries-vertical-space-between-entries,
  indent: 0.1in,
  body-indent: 0.5em,
)
#show list: set list(
  marker: dot,
  spacing: design-entries-vertical-space-between-entries,
  indent: 0.1in,
  body-indent: 0.5em,
)

// Links:
#let original-link = link
#let link(url, body) = original-link(url, [#underline(offset: 2.5pt, body)])

// Section Headings (mimicking \scshape\large + \titlerule)
#show heading.where(level: 2): it => [
  #set align(left)
  #set text(
    font: design-text-font-family,
    size: 1.2em,
    weight: 400,
  )
  #v(16pt, weak: true)
  #block(
    breakable: false,
    width: 100%,
    [
      #smallcaps(it.body)
      #v(0.4em)
      #box(width: 100%, height: 0.5pt, fill: black)
    ]
  )
  #v(0pt)
]

// Custom Layout Functions mimicking LaTeX commands
#let resume-quad-heading(title, date, subtitle, location) = [
  #block(
    width: 100%,
    breakable: true,
    [
      #grid(
        columns: (1fr, auto),
        align: (left, right),
        row-gutter: 0.64em, 
        [#strong(title)], [#date],
        [#emph(text(size: 1em, subtitle))],
        [#emph(text(size: 1em, location))]
      )
    ]
  )
]

#let resume-trio-heading(title, subtitle, right-content) = [
  #block(
    width: 100%,
    breakable: true,
    // FIXED MULTI-LINE SQUISHING: Uses h(1fr) to mimic LaTeX \hfill and force a single line
    [#strong(title) #h(1fr) #emph(text(size: 0.9em, subtitle)) #h(1fr) #right-content] 
  )
]