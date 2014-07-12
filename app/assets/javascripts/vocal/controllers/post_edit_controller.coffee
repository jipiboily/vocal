Vocal.PostEditController = Ember.ObjectController.extend
  actions:
    save: ->
      post = @get('model')
      # This is hacky, but depending on if we just created the post and got
      # redirected here or if we loaded the post, this is one or the other
      # that will work
      post_id = if post.id? then post.id else post.get('id')
      Vocal.CustomPostAdapter.update(post_id, Vocal.postProperties())