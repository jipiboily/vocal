Opinionated.PostRoute = Ember.Route.extend
  model: (params) ->
    @store.find('post', params.post_id)

  renderTemplate: ->
    @render('posts/show');
