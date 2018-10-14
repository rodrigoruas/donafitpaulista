import GMaps from 'gmaps/gmaps.js';

new GMaps({
  div: '#map',
  zoom: 14,
  lat: -23.634659,
  lng: -46.734382,
}).addMarker({
  lat: -23.634659,
  lng: -46.734382,
  infoWindow: {
  content:'Floricultura Flores Panamby'
  }
});
