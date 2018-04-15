//= require rails-ujs
//= require_tree .

jQuery(function($) {

  var move = function (event) {
    event.preventDefault();

    $("#click-me").css({
      position: "absolute",
      left: (Math.random() * window.innerWidth) + "px",
      top: (Math.random() * window.innerHeight) + "px",
    })
  }

  $("#click-me").on({
    mouseover: move,
    click: move
  })

  if ($("#response-code").length !== 0) { new CircleType($("#response-code")[0]) }
})
