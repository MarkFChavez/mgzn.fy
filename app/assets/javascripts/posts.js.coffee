class @Posts
  self = this

  @enableMasonry: (container) ->
    container.imagesLoaded ->
      container.masonry
        columnWidth: 70,
        itemSelector: '.post'

  @init: ->
    self.enableMasonry( $("#posts") )

$ ->
  Posts.init()
