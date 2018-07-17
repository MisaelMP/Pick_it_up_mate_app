$(document).ready(function () {

  const latitude = $('#map').data('latitude');
  const longitude = $('#map').data('longitude');
  const title = $('#map').data('title');

  handler = Gmaps.build('Google');
  handler.buildMap({ provider: {}, internal: {id: 'map'}}, function(){
    markers = handler.addMarkers([
      {
        "lat": latitude,
        "lng": longitude,
        // "picture": {
        //   "url": "http://fillmurray.com/32/32",
        //   "width":  32,
        //   "height": 32
        // },
        "infowindow": title
      }
    ]);
    handler.bounds.extendWith(markers);
    handler.fitMapToBounds();
  });
});
