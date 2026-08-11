# frozen_string_literal: true

require "nokogiri"

module CurriculumBilingual
  NAVIGATION = {
    "home" => { "en" => ["/", "About"], "es" => ["/es/", "Sobre mí"] },
    "research" => { "en" => ["/research/", "Research"], "es" => ["/es/investigacion/", "Investigación"] },
    "outreach" => { "en" => ["/outreach/", "Outreach"], "es" => ["/es/divulgacion/", "Divulgación"] },
    "cv" => { "en" => ["/cv/", "CV"], "es" => ["/es/cv/", "CV"] },
    "teaching" => { "en" => ["/teaching/", "Teaching"], "es" => ["/es/docencia/", "Docencia"] },
  }.freeze

  module_function

  def relative_url(site, path)
    baseurl = site.config["baseurl"].to_s.sub(%r{/$}, "")
    "#{baseurl}#{path}"
  end

  def absolute_url(site, path)
    "#{site.config['url'].to_s.sub(%r{/$}, '')}#{relative_url(site, path)}"
  end

  def replace_anchor_text(anchor, label, active)
    anchor.children.remove
    anchor.add_child(Nokogiri::XML::Text.new(label, anchor.document))
    return unless active

    current = Nokogiri::XML::Node.new("span", anchor.document)
    current["class"] = "sr-only"
    current.content = "(current)"
    anchor.add_child(current)
  end

  def localize_navigation(document, page, lang)
    current_key = page.data["translation_key"]

    NAVIGATION.each do |key, translations|
      source_path = relative_url(page.site, translations["en"][0])
      target_path, target_label = translations.fetch(lang)
      anchor = document.at_css(%(#navbar .navbar-nav a[href="#{source_path}"]))
      next unless anchor

      item = anchor.ancestors("li").first
      item["class"] = item["class"].to_s.split.reject { |name| name == "active" }.join(" ")
      active = key == current_key
      item["class"] = "#{item['class']} active".strip if active
      anchor["href"] = relative_url(page.site, target_path)
      replace_anchor_text(anchor, target_label, active)
    end

    brand = document.at_css("#navbar .navbar-brand")
    if current_key == "home"
      brand&.remove
    elsif lang == "es" && brand
      brand["href"] = relative_url(page.site, NAVIGATION["home"]["es"][0])
    end
  end

  def add_language_switch(document, page, lang)
    alternate_lang = lang == "es" ? "en" : "es"
    flag = lang == "es" ? "🇬🇧" : "🇪🇸"
    code = alternate_lang.upcase
    label = lang == "es" ? "View this page in English" : "Ver esta página en español"

    item = Nokogiri::XML::Node.new("li", document)
    item["class"] = "language-toggle-container"
    anchor = Nokogiri::XML::Node.new("a", document)
    anchor["class"] = "language-toggle"
    anchor["href"] = relative_url(page.site, page.data["translation_url"])
    anchor["lang"] = alternate_lang
    anchor["hreflang"] = alternate_lang
    anchor["title"] = label
    anchor["aria-label"] = label
    anchor.inner_html = %(<span aria-hidden="true">#{flag}</span><span class="language-code">#{code}</span>)
    item.add_child(anchor)

    theme_toggle = document.at_css("#navbar .toggle-container")
    theme_toggle ? theme_toggle.add_next_sibling(item) : document.at_css("#navbar .navbar-nav")&.add_child(item)
  end

  def add_alternate_links(document, page, lang)
    alternate_lang = lang == "es" ? "en" : "es"
    head = document.at_css("head")
    return unless head

    [[lang, page.url], [alternate_lang, page.data["translation_url"]]].each do |link_lang, path|
      link = Nokogiri::XML::Node.new("link", document)
      link["rel"] = "alternate"
      link["hreflang"] = link_lang
      link["href"] = absolute_url(page.site, path)
      head.add_child(link)
    end
  end

  def localize_spanish_controls(document)
    nav_toggle = document.at_css("#navbar .navbar-toggler-main")
    if nav_toggle
      nav_toggle["aria-label"] = "Abrir navegación"
      nav_toggle.at_css(".sr-only")&.content = "Abrir navegación"
    end

    theme_toggle = document.at_css("#light-toggle")
    if theme_toggle
      theme_toggle["title"] = "Cambiar tema"
      theme_toggle["aria-label"] = "Cambiar tema de color"
    end

    bib_search = document.at_css("#bibsearch")
    if bib_search
      bib_search["placeholder"] = "Escribe para filtrar"
      bib_search["aria-label"] = "Filtrar publicaciones"
    end

    document.css("footer .container text()").each do |node|
      node.content = node.text
        .gsub("Powered by", "Creado con")
        .gsub(" theme. Hosted by", ". Alojado en")
    end
  end

  def process(page)
    return unless page.output_ext == ".html"
    return unless page.data["translation_url"]

    lang = page.data["lang"] || page.site.config["lang"] || "en"
    document = Nokogiri::HTML(page.output)
    document.at_css("html")["lang"] = lang
    localize_navigation(document, page, lang)
    add_language_switch(document, page, lang)
    add_alternate_links(document, page, lang)
    localize_spanish_controls(document) if lang == "es"
    page.output = document.to_html
  end
end

Jekyll::Hooks.register :pages, :post_render do |page|
  CurriculumBilingual.process(page)
end
