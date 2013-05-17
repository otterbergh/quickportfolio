$(function() {
		var d1 = [[0, 28], [0.5, 28.6], [1, 30.0], [1.3, 26.4], [6.2, 26.4]];

		// A null signifies separate line segments

		//var d3 = [[0, 12], [7, 12], null, [7, 2.5], [12, 2.5]];

		var plot = $.plot("div#placeholder-stock", [ d1 ], {
			xaxis: {
        ticks: [
          [0, "19:00"],
          [1, "10:00"],
          [2, "11:00"],
          [3, "12:00"],
          [4, "13:00"],
          [5, "14:00"],
          [6, "15:00"],
          [7, "16:00"],
          [8, "17:00"],
          [9, "18:00"],
        ]
			}
		});
		/*var ctx = plot.getCanvas();
		var url = ctx.toDataURL("image/png");
		window.open(url, "bild", "width=600, height=200");*/
});
