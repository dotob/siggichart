$ = jQuery

$(document).ready ->
	$("#data").change ->
		loaddata this
		
	loaddata = (x) ->
		xml = $.parseXML($(x).val())
		xmlDoc = $(xml)
		i = 0
		speed = new Array
		logEntries = xmlDoc.find("LogEntry").each ->
			speed[i++] = parseInt($(this).find("Speed").text())
		alert speed.length
		min_max = Ico.series_min_max( [speed] );
		min = min_max[0];
		max = min_max[1];
		status_bar = {
			x : 100, 
			y:  8,
			attributes: { 'font-size': '14', fill: '#642', 'text-anchor': 'middle' }
		}

		g = new Ico.LineGraph( 
			"graph",
			[speed],
			{   
			min: min
			, max: max
			, font_size: 12
			, series_names: ['one']
			, value_labels: { add_padding: false }
			, units: 'm/s'
			, units_position: 0
			, x_padding_right: 15
			, colors: ['#228899', '#339933', 'grey']
			, mouseover_attributes: { stroke: 'green' }
			, curve_amount: 3
			, mouse_pointer: true
			, status_bar : status_bar
			, grid: true
			}
		)
