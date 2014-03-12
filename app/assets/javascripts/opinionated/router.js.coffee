# For more information see: http://emberjs.com/guides/routing/

Opinionated.Router.map ()->
  @resource "posts", ->
  @resource "post",
    path: ":post_id"
