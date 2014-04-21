Opinionated.CustomPostAdapter =
  create: ->
    @ajax("/admin/posts", 'POST')

  update: (post_id) ->
    @ajax("/admin/posts/#{post_id}", 'PUT')

  ajax: (url, verb) ->
    promise = $.ajax( @ajaxRequest(url, verb) )
    promise.fail (jqXHR, textStatus) ->
      alert "Request failed: " + textStatus
    promise

  ajaxRequest: (url, verb) ->
    url: url
    type: verb
    beforeSend: (xhr) ->
      xhr.setRequestHeader "X-CSRF-Token", $("meta[name=\"csrf-token\"]").attr("content")
    data:
      post: Opinionated.postProperties()