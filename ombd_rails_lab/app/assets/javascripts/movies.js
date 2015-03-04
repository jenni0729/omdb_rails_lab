$(document).ready (function(){
  $("form").on("submit"), function (event){
    event.preventDefault();

    var query = $("#movie").val();

    $("li").remove();

    $.getJSON("/search", {movie:query}, function(data){
      console.log(data);
    for (var i=0; i < data.length; i++) {
      $("ul").append("<li>" + data[i].Title + " - " + data[i].Year + "</li>");
        }
      });

    };
});

