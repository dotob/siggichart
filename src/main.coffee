$ = jQuery

$(document).ready ->
	$("#data").change ->
		loaddata this
		
convertToKmH = (ms) ->
	kmh = ms * 60 * 60 /1000 
	
loaddata = (x) ->
	xml = $.parseXML($(x).val())
	xmlDoc = $(xml)
	i = 0
	speed = new Array
	logEntries = xmlDoc.find("LogEntry").each ->
		speed[i++] = convertToKmH parseFloat $(this).find("Speed").text()
	min_max = Ico.series_min_max( [speed] );
	min = min_max[0];
	max = min_max[1];
	status_bar = {
		x : 100, 
		y:  8,
		attributes: { 'font-size': '14', fill: '#642', 'text-anchor': 'middle' }
	}

	g = new Ico.LineGraph( 
		$('graph'),
		[speed],
		{   
			min: min,
			max: max,
			font_size: 12,
			series_names: ['one'],
			value_labels: { add_padding: false },
			units: 'km/h',
			units_position: 100,
			x_padding_right: 15,
			colors: ['#228899'],
			mouseover_attributes: { stroke: 'green' },
			curve_amount: 3,
			mouse_pointer: true,
			status_bar: status_bar,
			grid: true,
			markers: false,
			marker_size: 5,
		}
	)
