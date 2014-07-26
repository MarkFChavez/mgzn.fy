class @Posts
  self = this

  @enableMasonry: ->
    $("#posts").masonry
      columnWidth: 70,
      itemSelector: '.post'

  @init: ->
    self.enableMasonry()

$ ->
  Posts.init()
