$(function() {
    var d1;
    var id = $("div.span6").attr("id");
    $.get("/stocks/progress/"+id, function(data) {
      d1 = data;
		  var plot = $.plot("div#placeholder", [ d1 ]);
    });
		/*var ctx = plot.getCanvas();
		var url = ctx.toDataURL("image/png");
		window.open(url, "bild", "width=600, height=200");*/
});