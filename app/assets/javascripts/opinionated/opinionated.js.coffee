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
#= require ./lib/editor
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


editor = new opinionatedEditor('.markdown', '.preview', true)
editor.init()