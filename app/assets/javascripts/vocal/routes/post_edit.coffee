Vocal.PostEditRoute = Ember.Route.extend
  renderTemplate: ->
    @render('posts/edit')

  model: (params) ->
    @store.find('post', params.post_id)