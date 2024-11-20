import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="calcul-dates"
export default class extends Controller {
  static targets = ["startDate", "endDate", "totalDate", "fixedPrice", "pricing"];

  select() {
    this.pricingTarget.innerText = "";
    const startDateValue = this.startDateTarget.value;
    const endDateValue = this.endDateTarget.value;

    if (!startDateValue || !endDateValue) {
      this.totalDateTarget.innerText = "0 jours";
      this.pricingTarget.innerText = "0€";
      return;
    }

    const startDate = new Date(startDateValue);
    const endDate = new Date(endDateValue);

    if (isNaN(startDate) || isNaN(endDate) || endDate < startDate) {
      this.totalDateTarget.innerText = "Dates invalides";
      this.pricingTarget.innerText = "0€";
      return;
    }

    // Calcul du nombre de jours entre les deux dates
    const totalDate = Math.round((endDate - startDate) / (1000 * 60 * 60 * 24));
    this.totalDateTarget.innerText = `${totalDate} jours`;

    // Calcul du prix total
    const fixedPrice = parseInt(this.fixedPriceTarget.innerText, 10);
    const totalPrice = totalDate * fixedPrice;
    this.pricingTarget.innerText = `${totalPrice}€`;
  }
}
