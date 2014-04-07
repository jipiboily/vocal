#= require foundation
#= require ./store
#= require_tree ./models
#= require_tree ./controllers
#= require_tree ./views
#= require_tree ./helpers
#= require_tree ./components
#= require_tree ./templates
#= require_tree ./routes
#= require ./router
#= require_self

$(document).foundation()

$(document).on "click", ".off-canvas-list a", (e) ->
  $(".left-off-canvas-toggle").click()