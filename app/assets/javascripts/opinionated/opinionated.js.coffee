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
#= require_self

$(document).foundation()

$(document).on "click", ".off-canvas-list a", (e) ->
  $(".left-off-canvas-toggle").click()


# Markdown helper  
Ember.Handlebars.helper "render-markdown", (input) ->
  new Handlebars.SafeString(marked(input))

# Marked's config
marked.setOptions
  renderer: new marked.Renderer()
  gfm: true
  tables: true
  breaks: false
  pedantic: false
  sanitize: true
  smartLists: true
  smartypants: false

$(document).on 'keyup', '.markdown', ->
  markdown = $(this).html()
  console.log('NOT CLEAN YET:')
  console.log(markdown)
  markdown = window.opidown.clean(markdown)
  console.log('Cleaned Markdown:')
  console.log(markdown)
  rendered_preview = new Handlebars.SafeString(marked(markdown)).string
  console.log('Rendered preview:')
  console.log(rendered_preview)
  $('.preview').html(rendered_preview)

class @Opidown
  clean: (content) ->
    content = content.replace(/<br>/g, "\n")
    content = content.replace(/<div>/g, "\n")
    content = content.replace(/<\/div>/g, "")
    content

window.opidown = new Opidown