Opinionated.PostNewController = Ember.ObjectController.extend
  actions:
    # TODO: this should be extracted in a componnent
    save: ->
      promise = Opinionated.CustomPostAdapter.create(Opinionated.postProperties())
      promise.done (post) =>
        @transitionToRoute('post.edit', post)