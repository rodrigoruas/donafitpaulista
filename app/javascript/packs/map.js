import GMaps from 'gmaps/gmaps.js';
import { autocomplete } from '../components/autocomplete';

new GMaps({
  div: '#map2',
  zoom: 14,
  lat: -23.634659,
  lng: -46.734382,
}).addMarker({
  lat: -23.634659,
  lng: -46.734382,
  infoWindow: {
  content:'Dona Fit Palista'
  }
});

autocomplete();
