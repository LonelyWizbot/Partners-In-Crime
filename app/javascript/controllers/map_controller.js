import { Controller } from "@hotwired/stimulus"
import mapboxgl from 'mapbox-gl'

// Connects to data-controller="map"
export default class extends Controller {
  static values = {
    apiKey: String,
    marker: Array
  }

  connect() {
    mapboxgl.accessToken = this.apiKeyValue;

    this.map = new mapboxgl.Map({
      container: this.element,
      style: "mapbox://styles/mapbox/streets-v10"
    });

    // Add markers and fit map bounds based on passed markers
    if (this.markerValue.length > 0) {
      this.#addMarkersToMap();
      this.#fitMapToMarkers();
    } else {
      console.log("No markers available");
    }
  }

  #addMarkersToMap() {
    this.markerValue.forEach((marker) => {
      // Create a popup with partner information
      const popup = new mapboxgl.Popup({ offset: 25 })
        .setHTML(`
          <div style="max-width: 200px;">
            <h5>${marker.partner.title}</h5>
            <p>${marker.partner.price}€</p>
            <a href="${marker.partner.url}" class="btn btn-primary btn-sm">En savoir plus</a>
          </div>
        `);

      // Add the marker with the popup
      new mapboxgl.Marker()
        .setLngLat([marker.longitude, marker.latitude])
        .setPopup(popup) // Attach the popup to the marker
        .addTo(this.map);
    });
  }

  #fitMapToMarkers() {
    const bounds = new mapboxgl.LngLatBounds();
    this.markerValue.forEach(marker => {
      bounds.extend([marker.longitude, marker.latitude]);
    });
    this.map.fitBounds(bounds, { padding: 70, maxZoom: 15, duration: 0 });
  }
}
