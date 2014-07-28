class @Posts
  self = this

  @enableMasonry: (container) ->
    container.imagesLoaded ->
      container.masonry
        columnWidth: 70,
        itemSelector: '.post'

  @filter: ->
    $(".filter").on "click", (e) ->
      e.preventDefault()
      strategy = $(this).data("strategy")

      if strategy isnt ""
        $(".post").hide()
        $(".#{strategy}").show()
      else
        $(".post").show()

      $("#posts").masonry()

  @init: ->
    self.enableMasonry( $("#posts") )
    self.filter()

$ ->
  Posts.init()
