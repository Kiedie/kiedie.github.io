{% macro image() %}
#pad(
  left: 0.4cm,
  right: 0cm,
  image(
    "{{ cv.photo.name }}",
    // Change both values together to resize the square portrait.
    width: 5cm,
    height: 5cm,
    fit: "cover",
  ),
)
{% endmacro %}

{% if cv.photo %}
#grid(
  columns: (1fr, auto),
  column-gutter: 0cm,
  // Centre the name vertically against the portrait.
  align: (left + horizon, left + top),
  [
{% endif %}
{% if cv.name %}
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
{% endif %}
#connections(
{% for connection in cv._connections %}
  [{{ connection }}],
{% endfor %}
)
{% if cv.photo %}
  ],
  [{{ image() }}],
)
{% endif %}
