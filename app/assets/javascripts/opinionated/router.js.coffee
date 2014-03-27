# For more information see: http://emberjs.com/guides/routing/

Opinionated.Router.map ()->
  @resource "posts", path: '/', ->
    @resource "post",
      path: "/posts/:post_id"
