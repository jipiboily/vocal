class @vocalEditor
  constructor: (@markdownSelector, @previewSelector, @debug = false) ->
    @cleaner = new divCleaner

  init: ->
    @bindEvents()

  bindEvents: ->
    that = @
    $(document).on 'keyup', @markdownSelector, ->
      that.preview($(this).html())

  clean: (content) ->
    @cleaner.clean(content)

  log: (text) ->
    console.log(text) if @debug
  
  preview: (markdown) ->
    @log('====================')
    @log('NOT CLEAN YET:')
    @log(markdown)
    markdown = @clean(markdown)
    @log('Cleaned Markdown:')
    @log(markdown)
    rendered_preview = @render(markdown)
    @log('Rendered preview:')
    @log(rendered_preview)
    # Update text area. TODO: this sound way more "hacky" than it should in Ember?
    $('textarea[name=markdown]').text(markdown)
    $('textarea[name=html]').text(rendered_preview)
    $(@previewSelector).html(rendered_preview)
  
  render: (markdown) ->
    new Handlebars.SafeString(marked(markdown)).string


class divCleaner
  clean: (content) ->
    content = @generalCleaning(content)
    
  # Right now, this is only tested with the latest version of Chrome and while 
  # this could work with other browsers, it is far from being guaranteed.
  generalCleaning: (content) ->
    content = content.replace(/<br>/g, "\n")
    content = content.replace(/<div>/g, "\n")
    content = content.replace(/<\/div>/g, "")
    content = content.replace(/&nbsp;/g, "")
    content