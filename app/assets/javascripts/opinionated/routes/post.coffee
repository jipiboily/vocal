Opinionated.PostRoute = Ember.Route.extend
  model: (params) ->
    @store.find('post', params.post_id)

posts: ->
    @store.find('post')
