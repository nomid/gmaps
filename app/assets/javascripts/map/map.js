function initialize() {
	if(document.getElementById('map')){
		var mapOptions = {
			center: { lat: -34.397, lng: 150.644},
			zoom: 8
		};
		var map = new google.maps.Map(document.getElementById('map'), mapOptions);

		map.addListener('click', function(e, b){
			var lat = e.latLng.k,
				lng = e.latLng.B;

			$.ajax({
				url: '/map_points',
				type: 'POST',
				dataType: 'json',
				data: { map_point: {
					latitude: lat,
					longitude: lng
				}},
				success: function(rsp){
					createMark(rsp.latitude, rsp.longitude).setMap(map);
					$('#map_points').append('\
						<tr>\
							<td>'+rsp.latitude+'</td>\
							<td>'+rsp.longitude+'</td>\
							<td>'+rsp.address+'</td>\
							<td><a href="/map_points/'+rsp.id+'" data-confirm="Are you sure?" data-method="delete" rel="nofollow">Destroy</a></td>\
						</tr>\
					');	
				}
			})
		})
			
		$.ajax({
	  		url: "/",
		  	type: "GET",
	  		dataType: "json",
	  		success: function(rsp){
	  			$.each(rsp, function(){
					createMark(this.latitude, this.longitude).setMap(map);
				});
	  		}
		});
	}
}

function createMark(latitude, longitude){
	var latlng = new google.maps.LatLng(latitude, longitude);
	return mark = new google.maps.Marker({
		position: latlng
	});
}

google.maps.event.addDomListener(window, 'load', initialize);
