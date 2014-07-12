Vocal.PostNewController = Ember.ObjectController.extend
  actions:
    # TODO: this should be extracted in a componnent
    save: ->
      promise = Vocal.CustomPostAdapter.create(Vocal.postProperties())
      promise.done (post) =>
        @transitionToRoute('post.edit', post)