Vocal.CustomPostAdapter =
  create: (properties) ->
    @ajax("/admin/posts", 'POST', properties)

  update: (post_id, properties) ->
    @ajax("/admin/posts/#{post_id}", 'PUT', properties)

  ajax: (url, verb, properties) ->
    promise = $.ajax( @ajaxRequest(url, verb, properties) )
    promise.fail (jqXHR, textStatus) ->
      alert "Request failed: " + textStatus
    promise

  ajaxRequest: (url, verb, properties) ->
    url: url
    type: verb
    beforeSend: (xhr) ->
      xhr.setRequestHeader "X-CSRF-Token", $("meta[name=\"csrf-token\"]").attr("content")
    data:
      post: properties