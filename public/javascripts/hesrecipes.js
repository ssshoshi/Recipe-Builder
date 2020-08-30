// attach colorbox to links
$(".link").colorbox({
  speed: 150,
  width: "1000px",
  initialHeight: "95%",
  transition: "elastic"
});

// open in colorbox after create
$("form").on("submit", function(e) {
  e.preventDefault();
  $.post(
    $("form").attr("action"),
    $("form").serialize(),
    function(data) {
      $.colorbox({
        width: "1000px",
        initialWidth: "1000px",
        html: data
      });
    },
    "html"
  );
});

// give colorbox better drop shadow
$("#colorbox").addClass("shadow-lg p-3 mb-5 bg-white rounded");

//reload index on Overlay click.
$("#cboxOverlay").on("click", function() {
  location.reload();
});
