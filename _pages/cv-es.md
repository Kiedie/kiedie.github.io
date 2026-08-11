---
layout: page
permalink: /es/cv/
title: CV
description: Aquí encontrarás una versión resumida de mi CV. Para consultar mi trayectoria académica completa, puedes descargar la versión en PDF.
lang: es
translation_key: cv
translation_url: /cv/
nav: false
nav_order: 5
cv_pdf: /assets/rendercv/rendercv_output/juanjo_herrera_aranda_cv.pdf
toc:
  sidebar: left
---

{% assign resume = site.data.resume_es %}

<div class="cv">
  {% if resume.basics %}
    {% assign basics = resume.basics %}
    <div class="card mt-3 p-3">
      <h3 class="card-title font-weight-medium">Datos de contacto</h3>
      <table class="table table-cv table-sm table-borderless">
        <tr>
          <td class="p-1 pr-2 font-weight-bold"><b>Nombre</b></td>
          <td class="p-1 pl-2 font-weight-light">{{ basics.name }}</td>
        </tr>
        <tr>
          <td class="p-1 pr-2 font-weight-bold"><b>Perfil profesional</b></td>
          <td class="p-1 pl-2 font-weight-light">{{ basics.label }}</td>
        </tr>
        <tr>
          <td class="p-1 pr-2 font-weight-bold"><b>Correo electrónico</b></td>
          <td class="p-1 pl-2 font-weight-light">{{ basics.email }}</td>
        </tr>
        <tr>
          <td class="p-1 pr-2 font-weight-bold"><b>Teléfono</b></td>
          <td class="p-1 pl-2 font-weight-light">{{ basics.phone }}</td>
        </tr>
        <tr>
          <td class="p-1 pr-2 font-weight-bold"><b>Sitio web</b></td>
          <td class="p-1 pl-2 font-weight-light"><a href="{{ basics.url }}">{{ basics.url }}</a></td>
        </tr>
      </table>
    </div>
  {% endif %}

{% if resume.work.size > 0 %}
<a class="anchor" id="experiencia"></a>
<div class="card mt-3 p-3">
<h3 class="card-title font-weight-medium">Experiencia</h3>
{% assign entries = resume.work %}
{% include cv/experience.liquid %}
</div>
{% endif %}

{% if resume.education.size > 0 %}
<a class="anchor" id="formacion"></a>
<div class="card mt-3 p-3">
<h3 class="card-title font-weight-medium">Formación académica</h3>
{% assign entries = resume.education %}
{% include cv/education.liquid %}
</div>
{% endif %}

{% if resume.awards.size > 0 %}
<a class="anchor" id="premios"></a>
<div class="card mt-3 p-3">
<h3 class="card-title font-weight-medium">Premios</h3>
{% assign entries = resume.awards %}
{% include cv/awards.liquid %}
</div>
{% endif %}

{% if resume.languages.size > 0 %}
<a class="anchor" id="idiomas"></a>
<div class="card mt-3 p-3">
<h3 class="card-title font-weight-medium">Idiomas</h3>
{% assign entries = resume.languages %}
{% include cv/languages.liquid %}
</div>
{% endif %}

</div>
