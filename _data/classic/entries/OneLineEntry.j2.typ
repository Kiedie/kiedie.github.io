{% if entry.label in ["Spanish", "English"] %}
#regular-entry(
  [{{ entry.details }}],
  [#strong[{{ entry.label }}]],
)
{% else %}
{{ entry.main_column }}
{% endif %}
