// Local override of RenderCV's classic preamble.
// It keeps the standard theme but places dates in a left-hand column,
// matching the structure of the reference academic CV.
#import "@preview/rendercv:0.3.0": *

#show: rendercv.with(
  name: "Juan José Herrera Aranda",
  title: "Juan José Herrera Aranda - CV",
  footer: context { [#emph[Juan José Herrera Aranda - #str(here().page())\/#str(counter(page).final().first())]] },
  top-note: [ #emph[Last updated in Oct 2026] ],
  locale-catalog-language: "en",
  text-direction: ltr,
  page-size: "a4",
  page-top-margin: 0.55in,
  page-bottom-margin: 0.55in,
  page-left-margin: 0.70in,
  page-right-margin: 0.70in,
  page-show-footer: true,
  page-show-top-note: false,
  colors-body: rgb(0, 0, 0),
  colors-name: rgb(28, 59, 88),
  colors-headline: rgb(44, 104, 223),
  colors-connections: rgb(28, 59, 88),
  colors-section-titles: rgb(28, 59, 88),
  colors-links: rgb(28, 59, 88),
  colors-footer: rgb(128, 128, 128),
  colors-top-note: rgb(128, 128, 128),
  typography-line-spacing: 0.48em,
  typography-alignment: "justified",
  typography-date-and-location-column-alignment: left,
  typography-font-family-body: "Source Sans 3",
  typography-font-family-name: "Source Sans 3",
  typography-font-family-headline: "Source Sans 3",
  typography-font-family-connections: "Source Sans 3",
  typography-font-family-section-titles: "Source Sans 3",
  typography-font-size-body: 9.25pt,
  typography-font-size-name: 30pt,
  typography-font-size-headline: 10.5pt,
  typography-font-size-connections: 9.5pt,
  typography-font-size-section-titles: 1.25em,
  typography-small-caps-name: false,
  typography-small-caps-headline: false,
  typography-small-caps-connections: false,
  typography-small-caps-section-titles: false,
  typography-bold-name: true,
  typography-bold-headline: false,
  typography-bold-connections: false,
  typography-bold-section-titles: true,
  links-underline: false,
  links-show-external-link-icon: false,
  header-alignment: left,
  header-photo-width: 5cm,
  header-space-below-name: 0.15cm,
  header-space-below-headline: 0.15cm,
  header-space-below-connections: 0.35cm,
  header-connections-hyperlink: true,
  header-connections-show-icons: false,
  header-connections-display-urls-instead-of-usernames: false,
  header-connections-separator: " | ",
  header-connections-space-between-connections: 0.5cm,
  section-titles-type: "with_partial_line",
  section-titles-line-thickness: 0.5pt,
  section-titles-space-above: 0.32cm,
  section-titles-space-below: 0.18cm,
  sections-allow-page-break: true,
  sections-space-between-text-based-entries: 0.18em,
  sections-space-between-regular-entries: 0.50em,
  entries-date-and-location-width: 2.0cm,
  entries-side-space: 0.2cm,
  entries-space-between-columns: 0.25cm,
  entries-allow-page-break: false,
  entries-short-second-row: true,
  entries-degree-width: 1cm,
  entries-summary-space-left: 0cm,
  entries-summary-space-above: 0cm,
  entries-highlights-bullet: "•",
  entries-highlights-nested-bullet: "•",
  entries-highlights-space-left: 0.15cm,
  entries-highlights-space-above: 0cm,
  entries-highlights-space-between-items: 0cm,
  entries-highlights-space-between-bullet-and-text: 0.5em,
  date: datetime(
    year: 2026,
    month: 10,
    day: 14,
  ),
)

// Render all dated entries with the date first and the main content second.
#let regular-entry(
  main-column,
  date-and-location-column,
  main-column-second-row: none,
) = block(breakable: false)[
  #grid(
    // RenderCV 2.8 does not propagate this external design value here.
    // Change 2.0cm to adjust the width of the left-hand date column.
    columns: (3.0cm, 1fr),
    column-gutter: 0.25cm,
    align: (left + top, left + top),
    date-and-location-column,
    [
      #main-column
      #if main-column-second-row != none {
        v(0.05cm)
        main-column-second-row
      }
    ],
  )
]


#grid(
  columns: (1fr, auto),
  column-gutter: 0cm,
  // Centre the name vertically against the portrait.
  align: (left + horizon, left + top),
  [
#align(left)[
  #stack(
    dir: ttb,
    // Increase this value to separate the first name from the surnames.
    spacing: 0.50cm,
    text(
      font: "Source Sans 3",
      // Change both 31pt values together to resize the full name.
      size: 31pt,
      weight: "bold",
      fill: rgb(28, 59, 88),
      [Juan José],
    ),
    text(
      font: "Source Sans 3",
      size: 40pt,
      weight: "bold",
      fill: rgb(44, 104, 223),
      [Herrera Aranda],
    ),
  )
]
#v(0.2cm)
#connections(
)
  ],
  [#pad(
  left: 0.4cm,
  right: 0cm,
  image(
    "yo_cv.jpg",
    // Change both values together to resize the square portrait.
    width: 5cm,
    height: 5cm,
    fit: "cover",
  ),
)
],
)


== Personal Information

#strong[Full name:] Juan José Herrera Aranda


#strong[Email:] #link("mailto:juanjoha@ugr.es")[juanjoha\@ugr.es], #link("mailto:jh16357@gmail.com")[jh16357\@gmail.com]


#strong[Phone:] #link("tel:+34663309300")[+34 663 309 300]


#strong[Nationality:] Spanish


#strong[Birth date:] 1999\/07\/29


#strong[Links:] #link("https://kiedie.github.io/")[Personal website], #link("https://scholar.google.com/citations?user=LDsT_WYAAAAJ")[Google Scholar], #link("https://www.linkedin.com/in/jjha99/")[LinkedIn]


== Professional Summary

PhD candidate in Computer Science at the University of Granada, specialising in #strong[zero-shot learning] and semantic-space preprocessing. My research experience encompasses machine learning, deep learning, generative artificial intelligence, and quantum machine learning, supported by a strong interdisciplinary background in mathematics and computer science. I have also conducted research at BBVA and as a visiting PhD student at the University of Nottingham.

== Education

#regular-entry(
  [
    #strong[PhD in Computer Science]

    #summary[Thesis: \"Preprocessing the Semantic Space in Zero-Shot Learning\", University of Granada, Granada, Spain.]

    - Supervisors: Isaac Triguero Velázquez, Guillermo Gómez-Trenado, and Francisco Herrera Triguero.

  ],
  [
    2023 – present

  ],
)

#regular-entry(
  [
    #strong[Master's Degree in Data Science and Computer Engineering]

    #summary[University of Granada, Granada, Spain.]

    - Final grade: 9.26\/10; GPA: 3.063\/4.

    - Master's thesis: \"Semantic-Inductive Attribute Selection for Zero-Shot Learning.\"

  ],
  [
    2024 – 2026

  ],
)

#regular-entry(
  [
    #strong[Master's Degree in Quantum Computing]

    #summary[University of Antonio de Nebrija, Madrid, Spain.]

    - Master's thesis: \"Quantum Generative Adversarial Networks.\"

  ],
  [
    2022 – 2023

  ],
)

#regular-entry(
  [
    #strong[Bachelor's Degree in Computer Science]

    #summary[University of Granada, Granada, Spain.]

    - Specialisation in Machine Learning and Computer Vision.

    - Bachelor's thesis: \"Development of Deep Learning Models Based on Recurrent Neural Networks for the Classification of Electrocardiograms.\"

  ],
  [
    2017 – 2022

  ],
)

#regular-entry(
  [
    #strong[Bachelor's Degree in Mathematics]

    #summary[University of Granada, Granada, Spain.]

    - Bachelor's thesis: \"Development of Deep Learning Models Based on Recurrent Neural Networks for the Classification of Electrocardiograms.\"

  ],
  [
    2017 – 2022

  ],
)

== Experience

#regular-entry(
  [
    #strong[PhD Student, Predoctoral Fellowship]

    #summary[Department of Computer Science and Artificial Intelligence, University of Granada, Granada, Spain.]

    - Funded by a research contract from the Regional Government of Andalusia.

  ],
  [
    2023 - present

  ],
)

#regular-entry(
  [
    #strong[Visiting PhD Student]

    #summary[University of Nottingham, Nottingham, United Kingdom.]

    - Collaborated in the Computer Vision Lab under the supervision of Shreyank N. Gowda. We worked with diffusion models applied to Zero-Shot Learning.

  ],
  [
    2025

  ],
)

#regular-entry(
  [
    #strong[Research Assistant, INCIBE Project]

    #summary[University of Granada, Granada, Spain.]

    - Research on General-Purpose Artificial Intelligence.

  ],
  [
    2023 - 2025

  ],
)

#regular-entry(
  [
    #strong[Quantum Computing Researcher]

    #summary[Banco Bilbao Vizcaya Argentaria (BBVA), Madrid, Spain.]

    - Research in Quantum Computing and Quantum Machine Learning.

  ],
  [
    2023

  ],
)

== Research

#regular-entry(
  [
    #strong[Semantic-Inductive Attribute Selection for Zero-Shot Learning]

    #summary[J. Herrera-Aranda, G. Gómez-Trenado, F. Herrera, and I. Triguero. Logic Journal of the IGPL.]

  ],
  [
    2025

  ],
)

#regular-entry(
  [
    #strong[A first approach to refine semantic spaces in zero-shot learning with a genetic algorithm]

    #summary[J. J. Herrera, F. Herrera, and I. Triguero. IEEE Congress on Evolutionary Computation (CEC), pp. 1-4.]

  ],
  [
    2025

  ],
)

#regular-entry(
  [
    #strong[A preliminary study on preprocessing the semantic space in zero-shot learning]

    #summary[J. J. Herrera Aranda, F. Herrera, and I. Triguero. International Conference on Hybrid Artificial Intelligence Systems (HAIS), pp. 177-189.]

  ],
  [
    2024

  ],
)

#regular-entry(
  [
    #strong[Aprendizaje Generalizado de Cero Ejemplos: Revisión del Estado del Arte y Estudio Preliminar de la Influencia del Preprocesamiento]

    #summary[XI Simposio Teoría y Aplicaciones de Minería de Datos, Conferencia de la Asociación Española para la Inteligencia Artificial (CAEPIA).]

  ],
  [
    2024

  ],
)

#regular-entry(
  [
    #strong[Quantum Adversarial Generative Networks]

    #summary[MSc thesis, University of Nebrija, Spain.]

  ],
  [
    2023

  ],
)

#regular-entry(
  [
    #strong[Development of Deep Learning Models Based on Recurrent Neural Networks for the Classification of Electrocardiograms]

    #summary[BSc thesis, University of Granada, Spain.]

  ],
  [
    2022

  ],
)

== Training courses

#regular-entry(
  [
    #strong[Agentic AI course]

    #summary[University of Granada, Granada, Spain.]

  ],
  [
    July 2026

  ],
)

#regular-entry(
  [
    #strong[International Winter School on General-Purpose Artificial Intelligence]

    #summary[University of Granada, Granada, Spain.]

  ],
  [
    Feb 2026

  ],
)

#regular-entry(
  [
    #strong[International Summer School on Data Science - Trustworthy, Safe and Governable AI]

    #summary[AdiaLab, University of Granada, Granada, Spain.]

  ],
  [
    July 2024

  ],
)

== Awards

#regular-entry(
  [
    #strong[Best Project, International Winter School on General-Purpose Artificial Intelligence]

    #summary[University of Granada.]

  ],
  [
    Feb 2026

  ],
)

#regular-entry(
  [
    #strong[Best Project, II DaSCi Pre-Doctoral Workshop]

    #summary[University of Granada.]

  ],
  [
    Dec 2024

  ],
)

#regular-entry(
  [
    #strong[Best Project, International Summer School on Data Science - Trustworthy, Safe and Governable AI]

    #summary[AdiaLab, University of Granada.]

  ],
  [
    July 2024

  ],
)

== Teaching

#regular-entry(
  [
    #strong[Theory of Computation]

    #summary[Bachelor's Degree in Computer Science and Mathematics, University of Granada, Granada, Spain.]

  ],
  [
    2026 - 2027

  ],
)

#regular-entry(
  [
    #strong[Introduction to Data Science]

    #summary[Bachelor's Degree in Data Science and Artificial Intelligence, University of Granada, Granada, Spain.]

  ],
  [
    2026 - 2027

  ],
)

#regular-entry(
  [
    #strong[Artificial Intelligence]

    #summary[Bachelor's Degree in Computer Science and Mathematics, University of Granada, Granada, Spain.]

  ],
  [
    2025 - 2026

  ],
)

#regular-entry(
  [
    #strong[Data Mining]

    #summary[Bachelor's Degree in Statistics, University of Granada, Granada, Spain.]

  ],
  [
    2025 - 2026

  ],
)

#regular-entry(
  [
    #strong[Machine Learning, Teaching Assistant]

    #summary[Bachelor's Degree in Computer Science, University of Granada, Granada, Spain.]

  ],
  [
    2025 - 2026

  ],
)

== Outreach and Talks

#regular-entry(
  [
    #strong[Three Minute Thesis Competition]

    #summary[Competition organised by the Coimbra Group for PhD students; reached the final. Granada, Spain.]

  ],
  [
    2026

  ],
)

#regular-entry(
  [
    #strong[Poster Session: Zero-Shot Learning]

    #summary[Winning final project in General Purpose AI Winter School. Granada, Spain.]

  ],
  [
    2026

  ],
)

#regular-entry(
  [
    #strong[Talk: \"Zero-Shot Learning for Image Classification using Generative Models.\"]

    #summary[Talk for the Computer Vision Lab during a visiting period at the University of Nottingham, Nottingham, United Kingdom.]

  ],
  [
    2025

  ],
)

#regular-entry(
  [
    #strong[Talk on the dangers of ChatGPT]

    #summary[Pint of Science. Granada, Spain.]

  ],
  [
    2025

  ],
)

#regular-entry(
  [
    #strong[Poster presentation]

    #summary[IEEE Congress on Evolutionary Computation. Hangzhou, China.]

  ],
  [
    2025

  ],
)

#regular-entry(
  [
    #strong[Talk: \"Preprocessing the Semantic Space in Zero-Shot Learning.\"]

    #summary[DaSCi Pre-Doctoral Workshops. Granada, Spain.]

  ],
  [
    2024

  ],
)

#regular-entry(
  [
    #strong[Mini-tutorials on using different AI tools]

    #summary[European Researchers' Night. Granada, Spain.]

  ],
  [
    2024

  ],
)

#regular-entry(
  [
    #strong[Jailbreaking in Large Language Models.]

    #summary[International Summer School on Data Science: Trustworthy, Safe and Governable AI. Granada, Spain.]

  ],
  [
    2024

  ],
)

== News and Media

#regular-entry(
  [
    #strong[Canal UGR]

    #summary[Reached the final of the Three Minute Thesis competition.]

  ],
  [
    2025

  ],
)

#regular-entry(
  [
    #strong[Radiolab UGR]

    #summary[Invited speaker on a podcast as a PhD student in Artificial Intelligence.]

  ],
  [
    2024

  ],
)

== Languages

#regular-entry(
  [Native speaker],
  [#strong[Spanish]],
)


#regular-entry(
  [Fluent],
  [#strong[English]],
)

