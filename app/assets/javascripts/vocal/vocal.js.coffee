#= require foundation
#= require ./store
#= require_tree ./models
#= require_tree ./controllers
#= require_tree ./views
#= require_tree ./helpers
#= require_tree ./components
#= require_tree ./templates
#= require_tree ./routes
#= require ./router
#= require_tree ./lib
#= require_self

$(document).foundation()

$(document).on "click", ".off-canvas-list a", (e) ->
  $(".left-off-canvas-toggle").click()

# Markdown helper
Ember.Handlebars.helper "render-markdown", (input) ->
  new Handlebars.SafeString(marked(input)) if input

# Marked's config
marked.setOptions
  renderer: new marked.Renderer()
  gfm: true
  tables: true
  breaks: false
  pedantic: false
  sanitize: true
  smartLists: false
  # smartLists: true
  smartypants: false
  langPrefix: 'language-'
  highlight: (code, lang, callback) ->
    decoded = $("<div/>").html(code).text();
    # Fallback to bash for unknown language
    # TODO: have it displayed to the author somehow.
    language = Prism.languages[lang] || Prism.languages['bash']
    Prism.highlight(decoded, language)

editor = new VocalEditor('.markdown', '.preview')
editor.init()

# This is a helper to remove duplicated code
Vocal.postProperties = ->
  title: $("input[name=title]").val()
  markdown: $("textarea[name=markdown]").text()
  html: $("textarea[name=html]").text()
  url: $("input[name=url]").val()
  published: $("input[name=published]").is(':checked')
  published_at: $("input[name=published_at]").val()
