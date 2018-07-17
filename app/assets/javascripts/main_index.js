$(document).ready(function () {


console.log( locations );


  const latitude = $('#map_index').data('latitude');
  const longitude = $('#map_index').data('longitude');
  const title = $('#map_index').data('title');

  handler = Gmaps.build('Google');
  handler.buildMap({ provider: {}, internal: {id: 'map_index'}}, function(){
    const locationMarkers = [];

    for (let i = 0; i < locations.length; i++) {
      let l = locations[i];
      locationMarkers.push({
        "lat": l.latitude,
        "lng": l.longitude,
        "infowindow": title
      });
    }

    console.log( 'markers', locationMarkers )

    markers = handler.addMarkers(locationMarkers);
    console.log('added markers')
    handler.bounds.extendWith(markers);
    handler.fitMapToBounds();
  });
});
