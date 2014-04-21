Opinionated.PostNewController = Ember.ObjectController.extend
  actions:
    # TODO: this should be extracted in a componnent
    save: ->
      ajaxRequest =
        url: "/admin/posts"
        type: "POST"
        beforeSend: (xhr) ->
          xhr.setRequestHeader "X-CSRF-Token", $("meta[name=\"csrf-token\"]").attr("content")
        data:
          post: Opinionated.postProperties()

      request = $.ajax(ajaxRequest)
      request.done (post) =>
        @transitionToRoute('post.edit', post)

      request.fail (jqXHR, textStatus) ->
        alert "Request failed: " + textStatus