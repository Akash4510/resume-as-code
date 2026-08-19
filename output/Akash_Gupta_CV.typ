#import "@preview/fontawesome:0.5.0": fa-icon

#let name = "Akash Gupta"
#let locale-catalog-language = "en"
#let design-page-size = "a4"
#let design-colors-text = rgb(0, 0, 0)
#let design-text-font-size = 10pt
#let design-text-leading = 0.55em
#let design-text-font-family = "Source Sans 3"
#let design-entries-vertical-space-between-entries = 0.8em
#let design-highlights-top-margin = 0.15cm

// Metadata:
#set document(author: name, title: name + "'s CV")

// Page settings:
#set page(
  margin: (
    top: 1.2cm,
    bottom: 1.2cm,
    left: 1.27cm,
    right: 1.27cm,
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

#grid(
  columns: (1fr, auto),
  align: (left + bottom, right + bottom),
  row-gutter: 1em,
  [
    #text(size: 24pt, weight: 700, [Akash Gupta])
  ],
  [
    #fa-icon("location-dot", size: 0.9em) #h(2pt) #text(size: 1em, weight: 400, [Bangalore, Karnataka, India])
  ],
  [
    #set text(size: 1em)
    #link("https://akashgupta.dev/")[#fa-icon("globe", size: 0.9em) #h(1pt) akashgupta.dev] |
    #link("https://linkedin.com/in/akash-gupta-12262a1b7")[#fa-icon("linkedin", size: 0.9em) #h(1pt) LinkedIn] |
    #link("https://github.com/Akash4510")[#fa-icon("github", size: 0.9em) #h(1pt) GitHub] |
    #link("https://leetcode.com/u/shadow718")[Leetcode]  ],
  [
    #fa-icon("envelope", size: 0.9em) #h(2pt) #link("mailto:akashgupta4510@gmail.com")[akashgupta4510\@gmail.com] |
    #fa-icon("phone", size: 0.9em) #h(2pt) #link("tel:+91-86177-31097")[+91-86177-31097]
  ]
)

#v(10pt)
#box(width: 100%, height: 0.5pt, fill: black)


#block(
  width: 100%,
  breakable: true,
  [
    #set text(size: 0.95em)
    #v(8pt)
    A detail-oriented Full-Stack Engineer with over a year of professional experience in Next.js and backend development. Proven ability to lead projects, architect scalable solutions, and mentor, collaborate, and learn from other developers. Passionate about leveraging advanced coding practices to build robust, high-performance applications that solve complex real-world problems.
  ]
)

== Technical Skills

#list(
  marker: dot,
  spacing: 0.8em,
  indent: 0in,
  body-indent: 0.5em,
  [#strong[Languages & Frameworks:] Next.js, React, Node.js, Express.js, TypeScript, JavaScript, Python, C++, C, Java, Tailwind, Prisma, Flask, Framer Motion, GSAP, Zustand, TanStack React Query]
)
#v(0.8em)

#list(
  marker: dot,
  spacing: 0.8em,
  indent: 0in,
  body-indent: 0.5em,
  [#strong[Databases & Platforms:] PostgreSQL, MongoDB, SQL, Git, AWS S3, Linux, Bash, Vercel]
)
#v(0.8em)

#list(
  marker: dot,
  spacing: 0.8em,
  indent: 0in,
  body-indent: 0.5em,
  [#strong[Core Concepts & Knowledge:] Full-Stack Architecture, Scalable Systems, API Design, OOP, DSA, CI\/CD, AI\/ML (Pandas, NumPy, Scikit-learn, TensorFlow, LangChain), Data Science, Salesforce]
)
#v(0.8em)

== Experience

#resume-quad-heading(
  [Tata Consultancy Services (TCS)],
  [
      Aug 2024 - Present
  ],
  [Full-Stack Engineer],
  [Bangalore, India]
)
#v(10pt)
#highlights(
  [Led the migration of multiple legacy websites from AEM to #strong[Next.js], #strong[reducing page load times by over 90\%] by leveraging #strong[SSR] and #strong[server actions], while optimizing the overall project architecture for scalability.],
  [Spearheaded the implementation of a #strong[custom asynchronous state management] solution #strong[(like tanstack react query)] with advanced features like #strong[timed caching] and #strong[optimistic updates], complementing the use of #strong[Redux] for the frontend.],
  [Pioneered a robust, scalable upload and download solution for #strong[large files (up to 50GB)] using #strong[Next.js] and #strong[AWS S3].],
  [Architected and implemented a multilingual #strong[internationalization system] that seamlessly integrated with an existing #strong[DevOps architecture], and enforced good coding practices to enable easy adoption and refactoring by other teams.],
  [Engineered and deployed dedicated and #strong[proxy APIs to enhance application security] while collaborating cross-functionally with diverse teams (including the #strong[JAVA microservices backend], APIGEE and Salesforce) to design and implement scalable, #strong[full-stack solutions] for the client. And also #strong[mentored] over 10 new and experienced developers.],
)
#v(12pt)


#resume-quad-heading(
  [Skiaverse (Internship)],
  [
      Jul 2023 - Dec 2023
  ],
  [Full-Stack Developer (Intern)],
  [Remote]
)
#v(10pt)
#highlights(
  [Architected and solely developed a full-stack web application from scratch using #strong[Vite, Express], and #strong[Postgres DB].],
  [Engineered advanced performance features like #strong[lazy loading, dynamic routing], and #strong[optimistic updates] for a robust, highly-praised UX, collaborating with cross-functional teams, ensuring robust data management for the application.],
)
#v(12pt)


== Education

#resume-quad-heading(
  [Techno Main Saltlake],
  [Kolkata, India, ],
  [B.Tech, Electronics and Instrumentation],
  [
    Aggregate CGPA: 9.4
  ]
)

== Projects

#resume-trio-heading(
  [AI Companion #h(0.5em)#link("https:\/\/ai-companion-nu.vercel.app\/")[#fa-icon("external-link", size: 0.9em)]],
  [],
  [
    #set text(size: 0.9em)
#strong[\[#link("https:\/\/github.com\/Akash4510\/ai-companion")[#fa-icon("github", size: 0.9em) #h(1pt) GitHub]\]]  ]
)
#v(8.5pt)
#highlights(
  [Engineered a full-stack SaaS AI companion platform leveraging the powerful #strong[Llama-2 model] with the #strong[Langchain] framework to create dynamic, personalized conversational experiences.],
)
#v(12pt)


#resume-trio-heading(
  [Team Chat (Discord Clone) ],
  [],
  [
    #set text(size: 0.9em)
#strong[\[#link("https:\/\/github.com\/Akash4510\/team-chat")[#fa-icon("github", size: 0.9em) #h(1pt) GitHub]\]]  ]
)
#v(8.5pt)
#highlights(
  [Architected a scalable, real-time chat application using #strong[WebSockets] with a polling fallback to power a foundation for live chats, direct messages with media upload and download support using #strong[Cloudinary], along with voice\/video channels.],
  [Developed a robust backend with #strong[Next.js] and #strong[Prisma] to handle multiple servers and thousands of messages, implementing advanced strategies like #strong[batch message loading] and live status handling for optimal performance.],
)
#v(12pt)


#resume-trio-heading(
  [Multi-tenant CMS E-commerce Dashboard ],
  [],
  [
    #set text(size: 0.9em)
#strong[\[#link("https:\/\/github.com\/Akash4510\/cms-multi-tenant-admin-dashboard")[#fa-icon("github", size: 0.9em) #h(1pt) GitHub]\]]  ]
)
#v(8.5pt)
#highlights(
  [Architected a scalable, #strong[multi-tenant] e-commerce #strong[CMS] with a central database, enabling seamless connection and management of multiple distinct frontend shops.],
  [Developed a robust admin dashboard with comprehensive product and inventory management, integrating real-time revenue tracking to provide business owners with actionable insights.],
)
#v(12pt)

