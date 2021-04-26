function initMap() {
	var map = new google.maps.Map(document.getElementById("map"), {
		center: {
			lat: 47.050582,
			lng: 8.297305,
		},
		zoom: 17,
		streetViewControl: false,
		mapTypeControl: false,
	});
}

function doSearch() {
	var houseNumber = $("#house-number").val();
	var street = $("#street").val();
	var city = $("#city").val();
	var country = $("#country").val();
	if (!houseNumber || !street || !city) {
		return;
	}
	var map = new google.maps.Map(document.getElementById("map"), {});
	var geocoder = new google.maps.Geocoder();
	geocoder.geocode(
		{
			address: houseNumber + " " + street + " " + city + " " + country,
		},
		function (results, status) {
			if (status === "OK") {
				map.setCenter(results[0].geometry.location);
				map.setZoom(19);
				var marker = new google.maps.Marker({
					map: map,
					position: results[0].geometry.location,
				});
			} else {
				console.log(status);
			}
		}
	);
}