Opinionated.PostEditController = Ember.ObjectController.extend
  actions: 
    save: ->
      post = @get('model')
      post.set('title', $('input[name=title]').val())
      post.set('markdown', $('textarea[name=markdown]').text())
      post.set('html', $('textarea[name=html]').text())
      post.save()