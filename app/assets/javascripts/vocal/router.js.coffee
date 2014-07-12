# For more information see: http://emberjs.com/guides/routing/

Vocal.Router.map ()->
  @resource "posts", path: '/', ->
    @resource "post.show", path: "/posts/:post_id"
  @resource "post.new", path: "/posts/new"
  @resource "post.edit", path: "/posts/:post_id/edit"