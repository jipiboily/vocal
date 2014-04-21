Opinionated.PostNewController = Ember.ObjectController.extend
  actions:
    # TODO: this should be extracted in a componnent
    save: ->
      promise = Opinionated.CustomPostAdapter.create()
      promise.done (post) =>
        @transitionToRoute('post.edit', post)